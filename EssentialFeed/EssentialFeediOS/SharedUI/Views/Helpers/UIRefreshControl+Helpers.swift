//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Daniel Tischenko on 08.02.2022.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
