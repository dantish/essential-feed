//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 13.05.2022.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
