//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Daniel Tischenko on 01.02.2022.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
