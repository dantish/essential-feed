//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Daniel Tischenko on 02.02.2022.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
