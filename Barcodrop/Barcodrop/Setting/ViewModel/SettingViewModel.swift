//
//  SettingViewModel.swift
//  Barcodrop
//
//  Created by SG on 2022/02/12.
//

import Foundation

class SettingViewModel {
    
    // Section List
    let sectionModelList = ["알림 설정", "Q&A", "기타"]
    
    // Section Sub List
    let section1: [SettingModel] = [
        SettingModel(name: "ON", switchButton: true, nextButton: false, nextLabel: false),
        SettingModel(name: "알림 날짜 / 시간 설정", switchButton: false, nextButton: false, nextLabel: false)
    ]
    
    let section2: [SettingModel] = [
        SettingModel(name: "자주 묻는 질문", switchButton: false, nextButton: true, nextLabel: false),
        SettingModel(name: "앱 사용법", switchButton: false, nextButton: false, nextLabel: false)
    ]
    
    let section3: [SettingModel] = [
        SettingModel(name: "언어 설정", switchButton: false, nextButton: true, nextLabel: true, nextText: "영어"),
        SettingModel(name: "데이터 초기화", switchButton: false, nextButton: false, nextLabel: false),
        SettingModel(name: "앱 버전 확인", switchButton: false, nextButton: false, nextLabel: false)
    ]
    
    var sectionCount: Int {
        return sectionModelList.count
    }
    
}
