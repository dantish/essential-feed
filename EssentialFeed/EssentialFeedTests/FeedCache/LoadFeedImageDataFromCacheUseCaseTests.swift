//
//  LoadFeedImageDataFromCacheUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Daniel Tischenko on 08.05.2022.
//

import XCTest
import EssentialFeed

class LoadFeedImageDataFromCacheUseCaseTests: XCTestCase {

    func test_init_doesNotMessageStoreUponCreation() {
        let (_, store) = makeSUT()

        XCTAssertTrue(store.receivedMessages.isEmpty)
    }

    func test_loadImageDataFromURL_requestsStoredDataFromURL() {
        let (sut, store) = makeSUT()
        let url = anyURL()

        _ = sut.loadImageData(from: url) { _ in }

        XCTAssertEqual(store.receivedMessages, [.retrieve(dataFor: url)])
    }

    func test_loadImageDataFromURL_failsOnStoreError() {
        let (sut, store) = makeSUT()

        expect(sut, toCompleteWith: failed(), when: {
            store.completeRetrieval(with: anyNSError())
        })
    }

    func test_loadImageDataFromURL_deliversNotFoundErrorOnNotFound() {
        let (sut, store) = makeSUT()

        expect(sut, toCompleteWith: notFound(), when: {
            store.completeRetrieval(with: .none)
        })
    }

    func test_loadImageDataFromURL_deliversStoredDataOnFoundData() {
        let (sut, store) = makeSUT()
        let data = anyData()

        expect(sut, toCompleteWith: .success(data), when: {
            store.completeRetrieval(with: data)
        })
    }

    func test_loadImageDataFromURL_doesNotDeliverResultAfterCancellingTask() {
        let (sut, store) = makeSUT()

        var received: [FeedImageDataLoader.Result] = []
        let task = sut.loadImageData(from: anyURL()) { received.append($0) }
        task.cancel()

        store.completeRetrieval(with: anyData())
        store.completeRetrieval(with: .none)
        store.completeRetrieval(with: anyNSError())

        XCTAssertTrue(received.isEmpty)
    }

    func test_loadImageDataFromURL_doesNotDeliverResultAfterSUTInstanceHasBeenDeallocated() {
        let store = FeedImageDataStoreSpy()
        var sut: LocalFeedImageDataLoader? = LocalFeedImageDataLoader(store: store)

        var received: [FeedImageDataLoader.Result] = []
        _ = sut?.loadImageData(from: anyURL()) { received.append($0) }

        sut = nil
        store.completeRetrieval(with: anyData())

        XCTAssertTrue(received.isEmpty)
    }

    // MARK: - Helpers

    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: LocalFeedImageDataLoader, store: FeedImageDataStoreSpy) {
        let store = FeedImageDataStoreSpy()
        let sut = LocalFeedImageDataLoader(store: store)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }

    private func failed() -> FeedImageDataLoader.Result {
        .failure(LocalFeedImageDataLoader.LoadError.failed)
    }

    private func notFound() -> FeedImageDataLoader.Result {
        .failure(LocalFeedImageDataLoader.LoadError.notFound)
    }

    private func expect(_ sut: LocalFeedImageDataLoader, toCompleteWith expectedResult: FeedImageDataLoader.Result, when action: () -> Void, file: StaticString = #filePath, line: UInt = #line) {
        let exp = expectation(description: "Wait for load completion")

        _ = sut.loadImageData(from: anyURL()) { receivedResult in
            switch (receivedResult, expectedResult) {
            case let (.success(receivedData), .success(expectedData)):
                XCTAssertEqual(receivedData, expectedData, file: file, line: line)
            case let (.failure(receivedError as LocalFeedImageDataLoader.LoadError),
                      .failure(expectedError as LocalFeedImageDataLoader.LoadError)):
                XCTAssertEqual(receivedError, expectedError, file: file, line: line)
            default:
                XCTFail("Expected result \(expectedResult), got \(receivedResult) instead", file: file, line: line)
            }

            exp.fulfill()
        }

        action()
        wait(for: [exp], timeout: 1.0)
    }

}
