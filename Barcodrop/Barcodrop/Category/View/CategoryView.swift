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
        imageSwipeSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        addSubview(imageView)
        imageView.addSubview(pageControl)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
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
        imageView.image = UIImage(named: String(Constant.categoryBannerImage[autoNum]))
        autoNum += 1
    }
    
}

// MARK: - Image Swipe

extension CategoryView {
    
    func pageControlSetting() {
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        imageView.image = UIImage(named: String(Constant.categoryBannerImage[0]))
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(autoChange), userInfo: nil, repeats: true)
    }
    
    func imageSwipeSetting() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(CategoryView.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(CategoryView.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left :
               pageControl.currentPage -= 1
             imageView.image = UIImage(named: Constant.categoryBannerImage[pageControl.currentPage])
            case UISwipeGestureRecognizer.Direction.right :
            pageControl.currentPage += 1
               imageView.image = UIImage(named: Constant.categoryBannerImage[pageControl.currentPage])
            default:
                break
            }
        }
    }
    
}
