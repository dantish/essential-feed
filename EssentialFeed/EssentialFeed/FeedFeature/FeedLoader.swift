//
//  Created by Daniel Tischenko on 08.11.2021.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedItem], Error>

    func load(completion: @escaping (Result) -> Void)
}
