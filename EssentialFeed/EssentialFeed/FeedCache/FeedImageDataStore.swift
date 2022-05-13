//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 13.05.2022.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>

    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}