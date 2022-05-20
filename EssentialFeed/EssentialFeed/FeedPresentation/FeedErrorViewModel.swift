//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 09.02.2022.
//

import Foundation

public struct FeedErrorViewModel {
    public let message: String?

    static var noError: FeedErrorViewModel {
        FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
