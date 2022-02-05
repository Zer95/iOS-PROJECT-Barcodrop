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
    
    let titleLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.textColor = .black
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
    
    init(title: String, image: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        titleLabel.attributedText = settingLable(title: " \(title) ", imgName: "\(image)")
        titleLabel.sizeToFit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(20)
            $0.left.equalToSuperview().offset(24)
        }
        
        addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(24)
            $0.right.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(24)
        }
        
        contentView.addSubview(listHeaderItem)
        listHeaderItem.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    func settingLable(title:String, imgName:String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        attributedString.append(NSAttributedString(string:"\(title)"))
        imageAttachment.image = UIImage(named: "\(imgName)")
        imageAttachment.bounds = CGRect(x: 0, y: 0, width: 18, height: 18)
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        return attributedString
    }
}
