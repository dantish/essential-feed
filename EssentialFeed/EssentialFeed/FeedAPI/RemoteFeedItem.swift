//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 14.12.2021.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
