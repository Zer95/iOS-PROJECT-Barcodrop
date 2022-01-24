//
//  FloatingView.swift
//  Barcodrop
//
//  Created by SG on 2022/01/24.
//

import UIKit
import SnapKit
import Then

class FloatingView: UIViewController {
    
    let scanButton = UIButton().then {
        $0.setImage(UIImage(named: "Floating_Scan"), for: .normal)
        $0.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(300)
        }
    }
    
    let editButton = UIButton().then {
        $0.setImage(UIImage(named: "Floating_Edit"), for: .normal)
        $0.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(300)
        }
    }
    
    lazy var floatingStackView = UIStackView(arrangedSubviews: [scanButton, editButton]).then {
        $0.axis = .vertical
        $0.spacing = 50
        $0.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0x000000, alpha: 0.4)
        
        configureUI()
        
        // 화면 터치시 view dismiss
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewMapTapped))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func configureUI() {
        super.viewDidLayoutSubviews()
        view.addSubview(floatingStackView)
        floatingStackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc func viewMapTapped(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
