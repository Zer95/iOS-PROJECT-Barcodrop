//
//  ListView.swift
//  Barcodrop
//
//  Created by SG on 2022/02/03.
//

import UIKit
import SnapKit
import Then

class ListView: UIView {
    
    let titleLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textAlignment = .natural
    }
    
    let contentView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        
        // shadow
        $0.layer.masksToBounds = true
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 1, height: 1)
        $0.layer.shadowRadius = 3
        $0.layer.shadowOpacity = 2
        $0.layer.masksToBounds = false
    }
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(24)
            $0.right.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(24)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
}
