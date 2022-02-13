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
    
    let alarmSelectView = AlarmSelectView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alarmSelectView.animation.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0x000000, alpha: 0.7)
        configureUI()
        
        // 화면 터치시 view dismiss
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewMapTapped))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    func configureUI() {
        view.addSubview(alarmSelectView)
        alarmSelectView.delegate = self
        alarmSelectView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
    @objc func viewMapTapped(sender: UITapGestureRecognizer) {
      //  self.dismiss(animated: true, completion: nil)
    }
    
}

extension AlarmSelectViewController: AlarmSelectViewDelegate {
    
    func actionHandle() {
        self.dismiss(animated: true, completion: nil)
    }

}
