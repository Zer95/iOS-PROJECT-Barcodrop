//
//  ListCollectionViewCell.swift
//  Barcodrop
//
//  Created by SG on 2022/02/06.
//

import UIKit
import SnapKit
import Then

class ListCollectionViewCell: UICollectionViewCell {
    
    let listCollectionViewCell = "ListCollectionViewCell"
    
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
        $0.textColor = .white
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
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
        imageView.addSubview(dateLabel)
        
        imageView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
    
}

