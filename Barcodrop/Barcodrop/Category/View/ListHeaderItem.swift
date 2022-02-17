//
//  ListTitleItem.swift
//  Barcodrop
//
//  Created by SG on 2022/02/05.
//

import UIKit
import SnapKit
import Then

class ListHeaderItem: UIView {
    
    let totalLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        $0.textColor = .black
        $0.text = "TOTAL: 0"
    }
    
    let safeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .systemGreen
        $0.text = "안전: 0"
    }
    
    let normalLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .systemOrange
        $0.text = "보통: 0"
    }
    
    let dangerLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .systemPink
        $0.text = "위험: 0"
    }
    
    let passLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .systemGray
        $0.text = "지남: 0"
    }
    
    lazy var stackLabel = UIStackView(arrangedSubviews: [safeLabel, normalLabel, dangerLabel, passLabel]).then {
        $0.axis = .horizontal
        $0.spacing = 5
        $0.backgroundColor = .white
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
        
        addSubview(totalLabel)
        addSubview(stackLabel)
        
        totalLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(3)
            $0.left.equalToSuperview().offset(10)
        }
        
        stackLabel.snp.makeConstraints {
            $0.centerY.equalTo(totalLabel)
            $0.right.equalToSuperview().inset(10)
        }
    }
    
}
