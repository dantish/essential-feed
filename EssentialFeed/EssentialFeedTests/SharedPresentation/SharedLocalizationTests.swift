//
//  SharedLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by Daniel Tischenko on 01.06.2022.
//

import XCTest
import EssentialFeed

class SharedLocalizationTests: XCTestCase {

    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Shared"
        let bundle = Bundle(for: LoadResourcePresenter<Any, DummyView>.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }

    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }

}
