//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 08.11.2021.
//

import Foundation

protocol FeedLoader {
    func load(completion: @escaping (Result<[FeedItem], Error>) -> Void)
}
