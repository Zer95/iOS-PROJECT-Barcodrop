//
//  CategoryView.swift
//  Barcodrop
//
//  Created by SG on 2022/01/26.
//

import UIKit
import SnapKit
import Then

class CategoryView: UIView {
    
    let imageView = UIImageView().then {
        $0.backgroundColor = .gray
    }
    
    let pageControl = UIPageControl()
    var timer = Timer()
    var autoNum:Int = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureUI()
        pageControlSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pageControlSetting() {
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        imageView.image = UIImage(named: String(Constant.categoryImageList[0]))
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(autoChange), userInfo: nil, repeats: true)
    }
    
    func configureUI() {
        
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageView.addSubview(pageControl)
        pageControl.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(10)
        }
        
    }
    
    @objc func autoChange(){
        if autoNum == 2{
            autoNum = 0
        }
        pageControl.currentPage = autoNum
        imageView.image = UIImage(named: String(Constant.categoryImageList[autoNum]))
        autoNum += 1
    }
    
}
