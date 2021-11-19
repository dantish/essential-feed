//
//  Created by Daniel Tischenko on 08.11.2021.
//

import Foundation

public typealias LoadFeedResult<Error: Swift.Error> = Result<[FeedItem], Error>

protocol FeedLoader {
    associatedtype Error: Swift.Error

    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
