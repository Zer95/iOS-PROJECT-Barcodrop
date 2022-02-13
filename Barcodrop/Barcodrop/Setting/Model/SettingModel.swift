//
//  SettingModel.swift
//  Barcodrop
//
//  Created by SG on 2022/02/12.
//

import Foundation

enum PageType {
    case none, pop, navi
}

struct SettingModel {
    
    let name: String
    let switchButton: Bool
    let nextButton: Bool
    let nextLabel: Bool
    let nextText: String
    let nextPage: Bool
    let nextPageType: PageType
    let nextPageIdentifier: Int
    
    init(name: String, switchButton: Bool, nextButton: Bool, nextLabel: Bool, nextText: String = "", nextPage: Bool, nextPageType: PageType = .none, nextPageIdentifier: Int = 9999) {
        self.name = name
        self.switchButton = switchButton
        self.nextButton = nextButton
        self.nextLabel = nextLabel
        self.nextText = nextText
        self.nextPage = nextPage
        self.nextPageType = nextPageType
        self.nextPageIdentifier = nextPageIdentifier
    }
    
}
