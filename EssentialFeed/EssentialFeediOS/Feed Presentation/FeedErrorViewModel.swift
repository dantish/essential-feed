//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Daniel Tischenko on 08.02.2022.
//

import Foundation

struct FeedErrorViewModel {
    let message: String?

    static var noError: FeedErrorViewModel {
        FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
