//
//  FAQView.swift
//  Barcodrop
//
//  Created by SG on 2022/02/13.
//

import UIKit
import Lottie

class FAQView: UIView {
    
    let animation = AnimationView()
    let animationView = UIView()
    
    let updateLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.text = "업데이트 예정"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        animationSetting()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        addSubview(animationView)
        animationView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        animationView.addSubview(animation)
        animation.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        addSubview(updateLabel)
        updateLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
    }
    
    func animationSetting() {
        animation.animation = Animation.named("FAQ")
        animation.frame = animationView.bounds
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .loop
        animation.play()
    }
    
}
