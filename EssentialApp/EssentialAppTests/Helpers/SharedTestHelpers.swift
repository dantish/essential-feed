//
//  SharedTestHelpers.swift
//  EssentialAppTests
//
//  Created by Daniel Tischenko on 21.05.2022.
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    Data("any data".utf8)
}
