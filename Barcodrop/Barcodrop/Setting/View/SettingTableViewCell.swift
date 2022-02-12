//
//  SettingTableViewCell.swift
//  Barcodrop
//
//  Created by SG on 2022/02/12.
//

import UIKit
import SnapKit
import Then

class SettingTableViewCell: UITableViewCell {

    let contentLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        $0.textColor = .black
        $0.textAlignment = .natural
        $0.text = "냉장"
    }
    
    let switchButton = UISwitch().then {
        $0.backgroundColor = .clear
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        addSubview(contentLabel)
        contentLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }
        
//        addSubview(switchButton)
//        switchButton.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.right.equalToSuperview().inset(16)
//        }
    }

}
