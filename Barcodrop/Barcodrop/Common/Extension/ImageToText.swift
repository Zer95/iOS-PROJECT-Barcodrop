//
//  ImageToText.swift
//  Barcodrop
//
//  Created by SG on 2022/02/06.
//

import UIKit

func settingLable(title:String, imgName:String) -> NSMutableAttributedString {
    let attributedString = NSMutableAttributedString(string: "")
    let imageAttachment = NSTextAttachment()
    attributedString.append(NSAttributedString(string:"\(title)"))
    imageAttachment.image = UIImage(named: "\(imgName)")
    imageAttachment.bounds = CGRect(x: 0, y: 0, width: 18, height: 18)
    attributedString.append(NSAttributedString(attachment: imageAttachment))
    return attributedString
}
