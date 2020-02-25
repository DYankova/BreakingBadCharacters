//
//  BreakingBadCharactersTests.swift
//  BreakingBadCharactersTests
//
//  Created by Didi on 21.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import XCTest
@testable import BreakingBadCharacters

class CharacterViewModelTests: XCTestCase {
    
    var characterViewModel: CharacterViewModel!
    var testDictOne:  [String: Any] = ["char_id":1,"name":"Rachel","occupation":["designer"],"img":"https://pmctvline2.files.wordpress.com/2019/06/friends-rachel.jpg?w=620","status":"Deceased","nickname":"Rachel","appearance":[2,3,4],]
    
    override func setUp() {
        characterViewModel = CharacterViewModel(CharacterModel(testDictOne))
    }

    override func tearDown() {
        characterViewModel = nil
    }

    func testGetSeasonsCorrect(){
        XCTAssertEqual(characterViewModel.getSeasons(), "Seasons: [\"2\", \"3\", \"4\"]")
    }
    
    func testGetSeasonsInCorrect(){
        XCTAssertNotEqual(characterViewModel.getSeasons(), "Seasons:[\"2\",\"3\", \"4\"]")
    }
}
