//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by Daniel Tischenko on 08.05.2022.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { 200 }
    
    var isOK: Bool { statusCode == Self.OK_200 }
}
