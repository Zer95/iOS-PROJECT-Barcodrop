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
    func actionHandleHelp()
}

class HomeView: UIView {
    
    var delegate: HomeViewDelegate?
    var upDownButtonState = false
    
    let sortButton = UIButton().then {
        $0.setTitle("날짜순", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        $0.addTarget(self, action: #selector(actionHandleDropDown), for: .touchDown)
    }
    
    let sortUpDownButton = UIButton().then {
        $0.setTitle("↓", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(actionHandleUpDown), for: .touchDown)
    }
    
    let helpButton = UIButton().then {
        $0.setImage(UIImage(named: "help")?.withRenderingMode(.alwaysTemplate), for: .normal) // withRenderingMode -> Tint Color 적용 시키기 위함.
        $0.addTarget(self, action: #selector(actionHandleHelp), for: .touchDown)
        $0.tintColor = .gray
    }
    
    lazy var sortStackView = UIStackView(arrangedSubviews: [sortButton, sortUpDownButton]).then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.backgroundColor = .white
    }
    
    let floatingButton = MDCFloatingButton().then {
        let image = UIImage(named: "scanIcon.jpg")
        $0.sizeToFit()
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(image, for: .normal)
        $0.setImageTintColor(.white, for: .normal)
        $0.backgroundColor = .white
      //  $0.addTarget(self, action: #selector(actionHandleDropDown), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        addSubview(sortStackView)
        addSubview(helpButton)
        
        sortStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(24)
            $0.height.equalTo(30)
        }
        
        helpButton.snp.makeConstraints {
            $0.centerY.equalTo(sortStackView)
            $0.right.equalToSuperview().inset(10)
            $0.width.height.equalTo(50)
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
    
    @objc func actionHandleHelp() {
        delegate?.actionHandleHelp()
    }
}
