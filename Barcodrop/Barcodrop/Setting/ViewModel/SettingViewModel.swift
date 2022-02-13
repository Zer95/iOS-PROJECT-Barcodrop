//
//  SettingViewModel.swift
//  Barcodrop
//
//  Created by SG on 2022/02/12.
//

import Foundation

class SettingViewModel {
    
    // Setting VC List
    let vcList = [AlarmSelectViewController(), FAQViewController()]

    // Section List
    let sectionModelList = ["알림 설정", "Q&A", "기타"]
    
    // Section Sub List
    let section1: [SettingModel] = [
        SettingModel(name: "ON", switchButton: true, nextButton: false, nextLabel: false, nextPage: false),
        SettingModel(name: "알림 날짜 / 시간 설정", switchButton: false, nextButton: false, nextLabel: false, nextPage: true, nextPageType: .pop, nextPageIdentifier: 0)
    ]
    
    let section2: [SettingModel] = [
        SettingModel(name: "자주 묻는 질문", switchButton: false, nextButton: true, nextLabel: false, nextPage: true, nextPageType: .navi , nextPageIdentifier: 1),
        SettingModel(name: "앱 사용법", switchButton: false, nextButton: false, nextLabel: false, nextPage: false)
    ]
    
    let section3: [SettingModel] = [
        SettingModel(name: "언어 설정", switchButton: false, nextButton: true, nextLabel: true, nextText: "영어", nextPage: false),
        SettingModel(name: "데이터 초기화", switchButton: false, nextButton: false, nextLabel: false, nextPage: false),
        SettingModel(name: "앱 버전 확인", switchButton: false, nextButton: false, nextLabel: false, nextPage: false)
    ]
    
    var sectionCount: Int {
        return sectionModelList.count
    }
    
}
