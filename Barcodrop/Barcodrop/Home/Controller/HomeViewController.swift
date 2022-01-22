//
//  HomeViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/01/22.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        configureUI()
    }

    
    private func configureUI() {
        view.addSubview(homeView)
        homeView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}
