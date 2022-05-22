//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 22.05.2022.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
