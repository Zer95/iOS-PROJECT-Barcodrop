//
//  HomeViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/01/22.
//

import UIKit
import SnapKit
import Then
import DropDown

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    let dropDown = DropDown()
    
    var sortUpDownState = true
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        configureUI()
        dropDownSetting()
        homeView.delegate = self
    }
    
    private func configureUI() {
        view.addSubview(homeView)
        homeView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    func dropDownSetting() {
        dropDown.dataSource = ["날짜순", "이름순", "구입순", "등록순"]
        dropDown.anchorView = homeView.sortButton
        
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!) // 출력방식 가리지 않고 표현
        dropDown.width = 70
        dropDown.cellHeight = 50
        dropDown.cornerRadius = 15
        dropDown.selectedTextColor = UIColor.white // 선택된 글씨 색상
        dropDown.selectionBackgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) // 선택된 배경 색상
        dropDown.textFont = UIFont.systemFont(ofSize: 20)
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
        homeView.sortButton.setTitle("\(item)", for: .normal)
        }
    }
    
}

extension HomeViewController: HomeViewDelegate {
  
    func actionHandleDropDown() {
        dropDown.show()
    }
    
    func actionHandleUpDown(selectState: Bool) {
        if selectState == true {
            homeView.sortUpDownButton.setTitle("↓", for: .normal)
        }
        else if selectState == false {
            homeView.sortUpDownButton.setTitle("↑", for: .normal)
        }
    }
    
}
