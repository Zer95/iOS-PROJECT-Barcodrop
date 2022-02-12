//
//  StatusHistoryView.swift
//  Barcodrop
//
//  Created by SG on 2022/02/12.
//

import UIKit
import SnapKit
import Then

class StatusHistoryView: UIView {
    
    let titleLabel = UILabel().then {
        $0.text = "알림"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    let dangerButton = UIButton().then {
        $0.setTitle("기간 임박 상품이 없습니다.", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.titleLabel?.textAlignment = .left
        //  $0.addTarget(self, action: #selector(), for: .touchDown)
        
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 1, height: 1)
        $0.layer.shadowRadius = 3
        $0.layer.shadowOpacity = 2
        $0.layer.masksToBounds = false
    }
    
    let passButton = UIButton().then {
        $0.setTitle("기간 지난 상품이 없습니다.", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.titleLabel?.textAlignment = .left
        //  $0.addTarget(self, action: #selector(), for: .touchDown)
        
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 1, height: 1)
        $0.layer.shadowRadius = 3
        $0.layer.shadowOpacity = 2
        $0.layer.masksToBounds = false
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(24)
        }
        
        addSubview(dangerButton)
        dangerButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(24)
            $0.right.equalToSuperview().inset(24)
            $0.height.equalTo(50)
        }
        
        addSubview(passButton)
        passButton.snp.makeConstraints {
            $0.top.equalTo(dangerButton.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(24)
            $0.right.equalToSuperview().inset(24)
            $0.height.equalTo(50)
        }
        
    }
}
