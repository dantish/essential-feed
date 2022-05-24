//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Daniel Tischenko on 24.05.2022.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
