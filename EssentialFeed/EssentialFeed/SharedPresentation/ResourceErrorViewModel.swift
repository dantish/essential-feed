//
//  ResourceErrorViewModel.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 09.02.2022.
//

import Foundation

public struct ResourceErrorViewModel {
    public let message: String?

    static var noError: ResourceErrorViewModel {
        ResourceErrorViewModel(message: nil)
    }

    static func error(message: String) -> ResourceErrorViewModel {
        ResourceErrorViewModel(message: message)
    }
}
