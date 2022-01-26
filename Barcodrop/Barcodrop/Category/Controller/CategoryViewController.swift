//
//  CategoryViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/01/22.
//

import UIKit
import SnapKit
import Then

class CategoryViewController: UIViewController {
    
    let headerTipView = CategoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(headerTipView)
        headerTipView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(400)
        }
    }
    
}
