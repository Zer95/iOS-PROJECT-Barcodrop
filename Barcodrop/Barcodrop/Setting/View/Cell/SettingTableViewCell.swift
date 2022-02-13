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
        $0.isHidden = true
    }
    
    let nextButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        $0.isHidden = true
        $0.snp.makeConstraints {
            $0.width.height.equalTo(16)
        }
    }
    
    let nextLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        $0.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        $0.textAlignment = .natural
        $0.text = "Next"
        $0.isHidden = true
    }
    
    lazy var nextStackView = UIStackView(arrangedSubviews: [nextLabel, nextButton]).then {
        $0.axis = .horizontal
        $0.spacing = 5
    }
    
    var settingData: SettingModel? {
        didSet { setData() }
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
        
        addSubview(switchButton)
        switchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(16)
        }
        
        addSubview(nextStackView)
        nextStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(16)
        }
    }
    
    func setData() {
        guard let data = settingData else { return }
        
        if data.switchButton == true {
            switchButton.isHidden = false
        }
        
        if data.nextButton == true {
            nextButton.isHidden = false
        }
        
        if data.nextLabel == true {
            nextLabel.isHidden = false
            nextLabel.text = data.nextText
        }
    }
    
}
