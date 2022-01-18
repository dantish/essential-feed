//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Daniel Tischenko on 28.12.2021.
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    URL(string: "https://any-url.com")!
}
