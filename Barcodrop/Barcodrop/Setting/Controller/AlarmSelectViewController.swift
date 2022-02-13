//
//  AlarmSelectViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/02/13.
//

import UIKit
import SnapKit
import Then

class AlarmSelectViewController: UIViewController {
    
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
    }
    
    
    @objc func viewMapTapped(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
