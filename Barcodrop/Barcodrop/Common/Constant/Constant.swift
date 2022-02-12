//
//  Constant.swift
//  Barcodrop
//
//  Created by SG on 2022/01/26.
//

import Foundation

struct Constant {
    
    // MARK: - Home
    
    // 홈 데이터 정렬 리스트
    static let homeSortList = [
        "날짜순",
        "이름순",
        "구입순",
        "등록순"
    ]
    
    // MARK: - Category
    
    // 카테고리 헤더 배너 이미지
    static let categoryBannerImage = [
        "tip1.jpg",
        "tip2.jpg",
        "tip3.jpg",
        "tip4.jpg"
    ]
    
    // 카테고리 리스트 항목
    static let categoryList = [
        "냉장",
        "냉동",
        "실온",
        "기타"
    ]
    
    // 카테고리 리스트 이미지 항목
    static let categoryImageList = [
        "fresh_on.png",
        "ice_on.png",
        "room_on.png",
        "etc_on.png"
    ]
    
    // MARK: - Setting
    
    // Section List
    static let sectionModel = ["알림 설정", "Q&A", "기타"]
    
    // Section Sub List
    static let section1 = ["ON", "알림 날짜 / 시간 설정"]
    static let section2 = ["자주 묻는 질문", "앱 사용법"]
    static let section3 = ["언어 설정", "데이터 초기화", "앱 버전확인"]
    
}
