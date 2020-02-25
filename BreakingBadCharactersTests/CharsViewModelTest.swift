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

    var charsViewModel: AllCharsViewModel!
    
    var testCharVMOne = CharacterViewModel(CharacterModel( ["char_id":1,"name":"Rachel","occupation":["designer"],"img":"https://pmctvline2.files.wordpress.com/2019/06/friends-rachel.jpg?w=620","status":"Deceased","nickname":"Rachel","appearance":[2,3,4]]))
    
    var testCharVMTwo = CharacterViewModel(CharacterModel( ["char_id":2,"name":"Monica","occupation":["cook"],"img":"https://vignette.wikia.nocookie.net/friends/images/2/2f/Monica_Geller-Bing_Season_10.png/revision/latest?cb=20180426182234","status":"Deceased","nickname":"Mon","appearance":[2,3]]))
    
    var testCharVMThree = CharacterViewModel(CharacterModel( ["char_id":3,"name":"Feeby","occupation":["designer"],"img":"https://hips.hearstapps.com/digitalspyuk.cdnds.net/14/36/ustv-friends-10.jpg?crop=1.00xw:0.735xh;0,0.0217xh&resize=480:*","status":"Deceased","nickname":"Feens","appearance":[3,5]]))
    
    override func setUp() {
        charsViewModel = AllCharsViewModel()
//        charsViewModel.currentCharViewModels.append(testCharVMOne)
//        charsViewModel.currentCharViewModels.append(testCharVMTwo)
//        charsViewModel.currentCharViewModels.append(testCharVMThree)
    }

    override func tearDown() {
        charsViewModel = nil
    }

    func testfilterByNameContains(){
        charsViewModel.currentCharViewModels.append(testCharVMTwo)
        charsViewModel.filterByName("Monica")
        XCTAssertEqual(charsViewModel.currentCharViewModels, charsViewModel.currentCharViewModels)
    }
    
    func testfilterByNameNotContains(){
        charsViewModel.currentCharViewModels.append(testCharVMTwo)
        charsViewModel.filterByName("Di")
        XCTAssertTrue(charsViewModel.currentCharViewModels.count == 0)
    }
    
    func testfilterByNameEmpty(){
        charsViewModel.currentCharViewModels.append(testCharVMTwo)
        charsViewModel.filterByName("")
        XCTAssertTrue(charsViewModel.currentCharViewModels.count == 0)
    }
    
    func testfilterByNameContainsMany(){
        charsViewModel.currentCharViewModels.append(testCharVMOne)
        charsViewModel.currentCharViewModels.append(testCharVMThree)
        charsViewModel.filterByName("e")
        XCTAssertEqual(charsViewModel.currentCharViewModels, charsViewModel.currentCharViewModels)
    }
    
    func testfilterBySeasonContains(){
        charsViewModel.currentCharViewModels.append(testCharVMOne)
        charsViewModel.currentCharViewModels.append(testCharVMThree)
        charsViewModel.filterBySeason(3)
        XCTAssertEqual(charsViewModel.currentCharViewModels, charsViewModel.currentCharViewModels)
    }
    
    func testfilterBySeasonNotContains(){
        charsViewModel.currentCharViewModels.append(testCharVMOne)
        charsViewModel.currentCharViewModels.append(testCharVMThree)
        charsViewModel.filterBySeason(7)
        XCTAssertTrue(charsViewModel.currentCharViewModels.count == 0)
    }
    
}
