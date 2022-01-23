//
//  HomeView.swift
//  Barcodrop
//
//  Created by SG on 2022/01/22.
//

import UIKit
import SnapKit
import Then
import MaterialComponents.MaterialButtons

protocol HomeViewDelegate: AnyObject {
    func actionHandleDropDown()
    func actionHandleUpDown(selectState:Bool)
}

class HomeView: UIView {
    
    var delegate: HomeViewDelegate?
    var upDownButtonState = false
    
    let sortButton = UIButton().then {
        $0.setTitle("날짜순", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(actionHandleDropDown), for: .touchDown)
    }
    
    let sortUpDownButton = UIButton().then {
        $0.setTitle("↑", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(actionHandleUpDown), for: .touchDown)
    }
    
    lazy var sortStackView = UIStackView(arrangedSubviews: [sortButton, sortUpDownButton]).then {
        $0.axis = .horizontal
        $0.spacing = 10
    }
    
    let floatingButton = MDCFloatingButton().then {
        let image = UIImage(named: "scanIcon.jpg")
        $0.sizeToFit()
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(image, for: .normal)
        $0.setImageTintColor(.white, for: .normal)
        $0.backgroundColor = .white
     //   $0.addTarget(self, action: #selector(actionHandleDropDown), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(sortStackView)
        sortStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(24)
        }
        
        addSubview(floatingButton)
        floatingButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(120)
            $0.right.equalToSuperview().inset(20)
        }
    }
    
    @objc func actionHandleDropDown() {
        delegate?.actionHandleDropDown()
    }
    
    @objc func actionHandleUpDown() {
        sortUpDownButton.isSelected = !sortUpDownButton.isSelected
        self.upDownButtonState = sortUpDownButton.isSelected
        delegate?.actionHandleUpDown(selectState: self.upDownButtonState)
    }
}
