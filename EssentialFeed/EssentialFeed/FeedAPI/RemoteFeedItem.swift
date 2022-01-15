//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 14.12.2021.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
