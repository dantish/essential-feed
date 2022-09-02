//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 22.05.2022.
//

import Foundation

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
