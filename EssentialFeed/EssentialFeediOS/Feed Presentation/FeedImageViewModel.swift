//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Daniel Tischenko on 01.02.2022.
//

import Foundation

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool

    var hasLocation: Bool {
        location != nil
    }
}
