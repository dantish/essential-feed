//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Daniel Tischenko on 09.12.2021.
//

import XCTest

class LocalFeedLoader {
    init(store: FeedStore) {

    }
}

class FeedStore {
    var deleteCacheFeedCallCount = 0
}

class CacheFeedUseCaseTests: XCTestCase {

    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)

        XCTAssertEqual(store.deleteCacheFeedCallCount, 0)
    }

}
