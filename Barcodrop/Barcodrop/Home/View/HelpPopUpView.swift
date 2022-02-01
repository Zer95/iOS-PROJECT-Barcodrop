//
//  HelpPopUpViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/01/23.
//

import UIKit
import SnapKit
import Then

class HelpPopUpView: UIViewController {
    
    let mainView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 15
        $0.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
    }
    
    let contentLabel = UILabel().then {
        $0.text = "등록한 상품을 날짜순, 입력순, 이름순, 구입순 으로 조회 할 수 있어요!"
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.numberOfLines = 10
        $0.textAlignment = .natural
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0x000000, alpha: 0.4)
        
        configureUI()
        
        // 화면 터치시 view dismiss
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewMapTapped))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func configureUI() {
        
        super.viewDidLayoutSubviews()
        
        view.addSubview(mainView)
        mainView.addSubview(contentLabel)
        
        mainView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.right.equalToSuperview().inset(50)
            $0.width.equalTo(200)
            $0.height.equalTo(100)
        }
        
        contentLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().inset(10)
        }
    }
    
    @objc func viewMapTapped(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
