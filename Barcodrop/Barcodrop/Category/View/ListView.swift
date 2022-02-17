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
    
    let listHeaderItem = ListHeaderItem()
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        super.layoutSubviews()
        
        addSubview(contentView)
        contentView.addSubview(listHeaderItem)
        
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(24)
            $0.right.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(24)
        }
        
        listHeaderItem.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
    }
    
}
