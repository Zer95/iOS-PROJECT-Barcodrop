//
//  FAQViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/02/13.
//

import UIKit
import SnapKit
import Then

class FAQViewController: UIViewController {
    
    let faqViwe = FAQView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(faqViwe)
        faqViwe.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}
