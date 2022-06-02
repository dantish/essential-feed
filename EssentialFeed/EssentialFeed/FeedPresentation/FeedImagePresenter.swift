//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 09.02.2022.
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location
        )
    }
}
