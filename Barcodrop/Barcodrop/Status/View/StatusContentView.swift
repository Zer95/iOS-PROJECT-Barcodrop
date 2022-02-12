//
//  StatusContentView.swift
//  Barcodrop
//
//  Created by SG on 2022/02/12.
//

import UIKit
import SnapKit
import Then

class StatusContentView: UIView {
    
    let dangerCircleView = UIImageView().then {
        $0.image = UIImage(named: "dangerCircle")
        $0.snp.makeConstraints {
            $0.width.height.equalTo(60)
        }
    }
    
    let dangerConutLabel = UILabel().then {
        $0.text = "0"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    let dangerLabel = UILabel().then {
        $0.text = "위험"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    let normalCircleView = UIImageView().then {
        $0.image = UIImage(named: "normalCircle")
        $0.snp.makeConstraints {
            $0.width.height.equalTo(60)
        }
    }
    
    let normalConutLabel = UILabel().then {
        $0.text = "0"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    let normalLabel = UILabel().then {
        $0.text = "보통"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    let safeCircleView = UIImageView().then {
        $0.image = UIImage(named: "safeCircle")
        $0.snp.makeConstraints {
            $0.width.height.equalTo(60)
        }
    }
    
    let safeCountLabel = UILabel().then {
        $0.text = "0"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    let safeLabel = UILabel().then {
        $0.text = "안전"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    let passCircleView = UIImageView().then {
        $0.image = UIImage(named: "passCircle")
        $0.snp.makeConstraints {
            $0.width.height.equalTo(60)
        }
    }
    
    let passConutLabel = UILabel().then {
        $0.text = "0"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    let passLabel = UILabel().then {
        $0.text = "지남"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    lazy var circleStackView = UIStackView(arrangedSubviews: [dangerCircleView, normalCircleView, safeCircleView, passCircleView]).then {
        $0.axis = .horizontal
        $0.spacing = 20
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
        
        addSubview(circleStackView)
        circleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.centerX.equalToSuperview()
        }
        
        // Count
        dangerCircleView.addSubview(dangerConutLabel)
        dangerConutLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        normalCircleView.addSubview(normalConutLabel)
        normalConutLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        safeCircleView.addSubview(safeCountLabel)
        safeCountLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        passCircleView.addSubview(passConutLabel)
        passConutLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        // Title
        addSubview(dangerLabel)
        dangerLabel.snp.makeConstraints {
            $0.top.equalTo(dangerCircleView.snp.bottom).offset(10)
            $0.centerX.equalTo(dangerCircleView)
        }
        
        addSubview(normalLabel)
        normalLabel.snp.makeConstraints {
            $0.top.equalTo(normalCircleView.snp.bottom).offset(10)
            $0.centerX.equalTo(normalCircleView)
        }
        
        addSubview(safeLabel)
        safeLabel.snp.makeConstraints {
            $0.top.equalTo(safeCircleView.snp.bottom).offset(10)
            $0.centerX.equalTo(safeCircleView)
        }
        
        addSubview(passLabel)
        passLabel.snp.makeConstraints {
            $0.top.equalTo(passCircleView.snp.bottom).offset(10)
            $0.centerX.equalTo(passCircleView)
        }
        
    }
}
