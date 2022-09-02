//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Daniel Tischenko on 01.02.2022.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
