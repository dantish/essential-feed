//
//  FeedEndpoint.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 05.06.2022.
//

import Foundation

public enum FeedEndpoint {
    case get

    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
}
