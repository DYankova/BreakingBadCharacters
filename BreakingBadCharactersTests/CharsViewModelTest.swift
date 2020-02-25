//
//  CharsViewModelTest.swift
//  BreakingBadCharactersTests
//
//  Created by Didi on 25.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import XCTest
@testable import BreakingBadCharacters

class CharsViewModelTest: XCTestCase {

    var charsViewModel: AllCharactersViewModel!
    var filter = Filter()
    
    var testCharVMOne = CharacterViewModel(CharacterModel( ["char_id":1,"name":"Rachel","occupation":["designer"],"img":"https://pmctvline2.files.wordpress.com/2019/06/friends-rachel.jpg?w=620","status":"Deceased","nickname":"Rachel","appearance":[2,3,4]]))
    
    var testCharVMTwo = CharacterViewModel(CharacterModel( ["char_id":2,"name":"Monica","occupation":["cook"],"img":"https://vignette.wikia.nocookie.net/friends/images/2/2f/Monica_Geller-Bing_Season_10.png/revision/latest?cb=20180426182234","status":"Deceased","nickname":"Mon","appearance":[2,4]]))
    
    var testCharVMThree = CharacterViewModel(CharacterModel( ["char_id":3,"name":"Feeby","occupation":["designer"],"img":"https://hips.hearstapps.com/digitalspyuk.cdnds.net/14/36/ustv-friends-10.jpg?crop=1.00xw:0.735xh;0,0.0217xh&resize=480:*","status":"Deceased","nickname":"Feens","appearance":[3,5]]))
    
    override func setUp() {
        charsViewModel = AllCharactersViewModel()
        charsViewModel.fetchedCharactersViewModels.append(testCharVMOne)
        charsViewModel.fetchedCharactersViewModels.append(testCharVMTwo)
        charsViewModel.fetchedCharactersViewModels.append(testCharVMThree)
    }

    override func tearDown() {
        charsViewModel = nil
    }

    func testfilterByNameContains(){
        XCTAssertEqual(filter.filterByName("Monica", charsViewModel.fetchedCharactersViewModels), [testCharVMTwo])
    }
    
    func testfilterByNameNotContains(){
        XCTAssertTrue(filter.filterByName("Di", charsViewModel.fetchedCharactersViewModels).count == 0)
    }
    
    func testfilterByNameEmpty(){
        XCTAssertTrue(filter.filterByName("", charsViewModel.fetchedCharactersViewModels).count == 0)
    }
    
    func testfilterByNameContainsMany(){
        XCTAssertEqual(filter.filterByName("e", charsViewModel.fetchedCharactersViewModels), [testCharVMOne, testCharVMThree])
    }
    
    func testfilterBySeasonContains(){
        XCTAssertEqual(filter.filterBySeason(3, charsViewModel.fetchedCharactersViewModels), [testCharVMOne, testCharVMThree])
    }
    
    func testfilterBySeasonNotContains(){
        XCTAssertTrue(filter.filterBySeason(7, charsViewModel.fetchedCharactersViewModels).count == 0)
    }
    
}
