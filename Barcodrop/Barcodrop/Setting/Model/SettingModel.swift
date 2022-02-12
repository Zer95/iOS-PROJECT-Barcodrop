//
//  SettingModel.swift
//  Barcodrop
//
//  Created by SG on 2022/02/12.
//

import Foundation

struct SettingModel {
    
    let name: String
    let switchButton: Bool
    let nextButton: Bool
    let nextLabel: Bool
    let nextText: String
    
    init(name: String, switchButton: Bool, nextButton: Bool, nextLabel: Bool, nextText: String = "") {
        self.name = name
        self.switchButton = switchButton
        self.nextButton = nextButton
        self.nextLabel = nextLabel
        self.nextText = nextText
    }
    
}
