//
//  AlarmDayButton.swift
//  Barcodrop
//
//  Created by SG on 2022/02/13.
//

import UIKit
import SnapKit
import Then

class AlarmDayButton: UIButton {
    
    init(title: String, tagIndex: Int) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        setImage(UIImage(systemName: "square"), for: .normal)
        tintColor = .orange
        tag = tagIndex
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
