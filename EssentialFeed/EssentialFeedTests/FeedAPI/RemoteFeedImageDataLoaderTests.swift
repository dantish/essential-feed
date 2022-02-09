//
//  RemoteFeedImageDataLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Daniel Tischenko on 09.02.2022.
//

import XCTest

final class RemoteFeedImageDataLoader {
    init(client: Any) {

    }
}

class RemoteFeedImageDataLoaderTests: XCTestCase {

    func test_init_doesNotPerformAnyURLRequest() {
        let client = HTTPClientSpy()

        _ = RemoteFeedImageDataLoader(client: client)

        XCTAssertTrue(client.requestedURLs.isEmpty)
    }

    // MARK: - Helpers

    private class HTTPClientSpy {
        var requestedURLs: [URL] = []
    }

}
