//
//  ListTableViewCell.swift
//  Barcodrop
//
//  Created by SG on 2022/02/06.
//

import UIKit
import SnapKit
import Then

class ListTableViewCell: UITableViewCell {
    
    let categoryLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.textColor = .black
        $0.textAlignment = .natural
        $0.text = "냉장"
    }
    
    let listView = UIView().then {
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
    
    let listHeaderItem = ListHeaderItem()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.selectionStyle = .none
        self.backgroundColor = .white
        
        addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(20)
            $0.left.equalToSuperview().offset(26)
        }
        
        addSubview(listView)
        listView.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(24)
            $0.right.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(24)
        }
        
        listView.addSubview(listHeaderItem)
        listHeaderItem.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
        
    }
    
}
