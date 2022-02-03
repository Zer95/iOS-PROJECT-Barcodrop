//
//  CategoryViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/01/22.
//

import UIKit
import SnapKit
import Then

class CategoryViewController: UIViewController {
    
    let scrollView = UIScrollView().then {
        $0.contentInsetAdjustmentBehavior = .never // * 공백 제거
    }
    let contentView = UIView()
    let headerTipView = CategoryView()
    
    let freshView = ListView(title: "냉장")
    let iceView = ListView(title: "냉동")
    let roomView = ListView(title: "실온")
    let etcView = ListView(title: "기타")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configureUI()
        imageSwipeSetting()
    }
    
    func configureUI() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerTipView)
        contentView.addSubview(freshView)
        contentView.addSubview(iceView)
        contentView.addSubview(roomView)
        contentView.addSubview(etcView)
        
        scrollView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(device.screenWidth)
            $0.height.equalTo(1400)
        }
        
        headerTipView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        freshView.snp.makeConstraints {
             $0.top.equalTo(headerTipView.snp.bottom).offset(20)
             $0.left.right.equalToSuperview()
             $0.height.equalTo(200)
         }
        
        iceView.snp.makeConstraints {
             $0.top.equalTo(freshView.snp.bottom).offset(20)
             $0.left.right.equalToSuperview()
             $0.height.equalTo(200)
         }
        
        roomView.snp.makeConstraints {
             $0.top.equalTo(iceView.snp.bottom).offset(20)
             $0.left.right.equalToSuperview()
             $0.height.equalTo(200)
         }
        
        etcView.snp.makeConstraints {
             $0.top.equalTo(roomView.snp.bottom).offset(20)
             $0.left.right.equalToSuperview()
             $0.height.equalTo(200)
         }
        
    }
    
}

// MARK: - Header Image Swipe

extension CategoryViewController {
    
    func imageSwipeSetting() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(CategoryViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(CategoryViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left :
                headerTipView.pageControl.currentPage -= 1
                headerTipView.imageView.image = UIImage(named: Constant.categoryImageList[headerTipView.pageControl.currentPage])
            case UISwipeGestureRecognizer.Direction.right :
                headerTipView.pageControl.currentPage += 1
                headerTipView.imageView.image = UIImage(named: Constant.categoryImageList[headerTipView.pageControl.currentPage])
            default:
                break
            }
            
        }
        
    }
    
}
