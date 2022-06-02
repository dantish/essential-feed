//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 09.02.2022.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?

    public var hasLocation: Bool {
        location != nil
    }
}
