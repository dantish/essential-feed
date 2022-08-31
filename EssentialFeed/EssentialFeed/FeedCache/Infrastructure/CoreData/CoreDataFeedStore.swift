//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 02.01.2022.
//

import CoreData

public final class CoreDataFeedStore {
    private static let modelName = "FeedStore"
    private static let model = NSManagedObjectModel.with(name: modelName, in: Bundle(for: CoreDataFeedStore.self))

    private let container: NSPersistentContainer
    private let context: NSManagedObjectContext

    enum StoreError: Error {
        case modelNotFound
        case failedToLoadPeristentContainer(Error)
    }

    public init(storeURL: URL) throws {
        guard let model = Self.model else {
            throw StoreError.modelNotFound
        }

        do {
            container = try NSPersistentContainer.load(name: Self.modelName, model: model, url: storeURL)
            context = container.newBackgroundContext()
        } catch {
            throw StoreError.failedToLoadPeristentContainer(error)
        }
    }

    func performAsync(_ action: @escaping (NSManagedObjectContext) -> Void) {
        let context = self.context
        context.perform { action(context) }
    }

    private func cleanUpReferencesToPersistentStores() {
        context.performAndWait {
            let coordinator = self.container.persistentStoreCoordinator
            try? coordinator.persistentStores.forEach(coordinator.remove)
        }
    }

    deinit {
        cleanUpReferencesToPersistentStores()
    }

}
