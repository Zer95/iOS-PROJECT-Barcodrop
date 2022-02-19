//
//  SettingTitleView.swift
//  Barcodrop
//
//  Created by SG on 2022/02/19.
//

import UIKit
import SnapKit
import Then

class SettingTitleView: UIView {

    let titleLabel =  UILabel().then {
        $0.text = "Title"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
    }
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = .black
      //  $0.addTarget(self, action: #selector(actionHandleButton), for: .touchDown)
    }
    
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        addSubview(titleLabel)
        addSubview(backButton)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(25)
        }
        
    }

}
