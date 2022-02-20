//
//  FAQViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/02/13.
//

import UIKit
import SnapKit
import Then

class FAQViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let faqViwe = FAQView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        
        // 화면 제스처 추가
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        faqViwe.titleView.backButton.addTarget(self, action: #selector(backButton), for: .touchDown)
    }
    
    private func configureUI() {
        view.addSubview(faqViwe)
        faqViwe.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    @objc func backButton() {
        navigationController?.popViewController(animated: true)
    }
    
}
