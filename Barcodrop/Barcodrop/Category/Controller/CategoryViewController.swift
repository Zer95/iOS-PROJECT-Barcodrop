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
    
    let headerTipView = CategoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configureUI()
        imageSwipeSetting()
    }
    
    func configureUI() {
        view.addSubview(headerTipView)
        headerTipView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(400)
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
