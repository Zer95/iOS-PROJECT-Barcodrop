//
//  HomeProductCollectionViewCell.swift
//  Barcodrop
//
//  Created by SG on 2022/01/23.
//

import UIKit
import SnapKit
import Then

class HomeProductCollectionViewCell: UICollectionViewCell {
    
    let homeProductCollectionViewCell = "HomeProductCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.backgroundColor = .gray
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
        $0.image = UIImage(named: "main")
    }
    
    let titleLabel = UILabel().then {
        $0.text = "사과"
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    let dateLabel = UILabel().then {
        $0.text = "D-7"
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textAlignment = .center
        $0.textColor = .gray
    }
    
    //MARK:- Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Configure
    
    private func configureUI() {
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        
        imageView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(150)
        }
    
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(5)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(5)
        }
    }
    
}

