//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 22.05.2022.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
