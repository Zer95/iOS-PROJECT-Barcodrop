//
//  HomeView.swift
//  Barcodrop
//
//  Created by SG on 2022/01/22.
//

import UIKit
import SnapKit
import Then

class HomeView: UIView {
    
    let sortButton = UIButton().then {
        $0.setTitle("날짜순", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let sortUpDownButton = UIButton().then {
        $0.setTitle("↑", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    lazy var sortStackView = UIStackView(arrangedSubviews: [sortButton, sortUpDownButton]).then {
        $0.axis = .horizontal
        $0.spacing = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(sortStackView)
        sortStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(24)
        }
    }
}

