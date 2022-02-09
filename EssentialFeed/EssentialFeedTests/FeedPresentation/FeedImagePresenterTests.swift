//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Daniel Tischenko on 09.02.2022.
//

import XCTest

final class FeedImagePresenter {
    init(view: Any) {
        
    }
}

class FeedImagePresenterTests: XCTestCase {

    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()

        _ = FeedImagePresenter(view: view)

        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }

    // MARK: - Helpers

    private class ViewSpy {
        let messages: [Any] = []
    }

}
