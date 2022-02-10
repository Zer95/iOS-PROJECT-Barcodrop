//
//  StatusSideView.swift
//  Barcodrop
//
//  Created by SG on 2022/02/10.
//

import UIKit
import SnapKit
import Then

class StatusSideView: UIView {
    
    let freshImage = UIImageView().then {
        $0.image = UIImage(named: "fresh_on.png")
        $0.snp.makeConstraints {
            $0.width.height.equalTo(40)
        }
    }
    
    let freshLabel = UILabel().then {
        $0.text = "0"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0.9349866509, green: 0.6843166351, blue: 0.7154654264, alpha: 1)
    }
    
    lazy var freshStackView = UIStackView(arrangedSubviews: [freshImage, freshLabel]).then {
        $0.axis = .horizontal
        $0.spacing = 20
    }
    
    let iceImage = UIImageView().then {
        $0.image = UIImage(named: "ice_on.png")
        $0.snp.makeConstraints {
            $0.width.height.equalTo(40)
        }
    }
    
    let iceLabel = UILabel().then {
        $0.text = "0"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0, green: 0.7157182097, blue: 0.9544565082, alpha: 1)
    }
    
    lazy var iceStackView = UIStackView(arrangedSubviews: [iceImage, iceLabel]).then {
        $0.axis = .horizontal
        $0.spacing = 20
    }
    
    let roomImage = UIImageView().then {
        $0.image = UIImage(named: "room_on.png")
        $0.snp.makeConstraints {
            $0.width.height.equalTo(40)
        }
    }
    
    let roomLabel = UILabel().then {
        $0.text = "0"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0.4865615368, green: 0.9425002933, blue: 0.7065398097, alpha: 1)
    }
    
    lazy var roomStackView = UIStackView(arrangedSubviews: [roomImage, roomLabel]).then {
        $0.axis = .horizontal
        $0.spacing = 20
    }
    
    let etcImage = UIImageView().then {
        $0.image = UIImage(named: "etc_on.png")
        $0.snp.makeConstraints {
            $0.width.height.equalTo(40)
        }
    }
    
    let etcLabel = UILabel().then {
        $0.text = "0"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    }
    
    lazy var etcStackView = UIStackView(arrangedSubviews: [etcImage, etcLabel]).then {
        $0.axis = .horizontal
        $0.spacing = 20
    }
    
    lazy var sideStack = UIStackView(arrangedSubviews: [freshStackView, iceStackView, roomStackView, etcStackView]).then {
        $0.axis = .vertical
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
        addSubview(sideStack)
        sideStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
