//
//  HomeViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/01/22.
//

import UIKit
import SnapKit
import Then
import DropDown
import MaterialComponents.MaterialButtons

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    let dropDown = DropDown()
    
    let homeProductCollectionViewCell = "HomeProductCollectionViewCell"
    
    lazy var homeProductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.register(HomeProductCollectionViewCell.self, forCellWithReuseIdentifier: homeProductCollectionViewCell)
        $0.backgroundColor = .white
        $0.isScrollEnabled =  true
        $0.delegate = self
        $0.dataSource = self
    }
    
    private let layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
        $0.minimumInteritemSpacing = 1
        $0.sectionInset = UIEdgeInsets(top: 30, left: 15, bottom: 30, right: 15)
        $0.itemSize = CGSize(width: 180, height: 340)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        configureUI()
        dropDownSetting()
        homeView.delegate = self
    }
    
    private func configureUI() {
        
        view.addSubview(homeView)
        view.addSubview(homeProductCollectionView)
        view.addSubview(homeView.floatingButton)
        
        homeView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        homeProductCollectionView.snp.makeConstraints {
            $0.top.equalTo(homeView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        homeView.floatingButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(120)
            $0.right.equalToSuperview().inset(20)
        }
        homeView.floatingButton.addTarget(self, action: #selector(actionHandleFloating), for: .touchUpInside)
    }
    
}

// MARK: - DropDownSetting

extension HomeViewController {
    
    func dropDownSetting() {
        dropDown.dataSource = Constant.homeSortList
        dropDown.anchorView = homeView.sortButton
        
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!) // 출력방식 가리지 않고 표현
        dropDown.width = 70
        dropDown.cellHeight = 50
        dropDown.cornerRadius = 15
        dropDown.selectedTextColor = UIColor.white // 선택된 글씨 색상
        dropDown.selectionBackgroundColor = #colorLiteral(red: 1, green: 0.7276403904, blue: 0.4232866168, alpha: 1) // 선택된 배경 색상
        dropDown.textFont = UIFont.systemFont(ofSize: 20)
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            homeView.sortButton.setTitle("\(item)", for: .normal)
        }
    }
    
}

// MARK: - HomeView : HomeViewDelegate

extension HomeViewController: HomeViewDelegate {
    
    func actionHandleDropDown() {
        dropDown.show()
    }
    
    func actionHandleUpDown(selectState: Bool) {
        if selectState == true {
            homeView.sortUpDownButton.setTitle("↑", for: .normal)
        }
        else if selectState == false {
            homeView.sortUpDownButton.setTitle("↓", for: .normal)
        }
    }
    
    func actionHandleHelp() {
        let vc = HelpPopUpView()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func actionHandleFloating() {
        let vc = FloatingView()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
}

// MARK: - CollectionView : homeProductCollectionView

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeProductCollectionView.dequeueReusableCell(withReuseIdentifier: homeProductCollectionViewCell, for: indexPath) as! HomeProductCollectionViewCell
        
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    //DelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (view.frame.size.width/2.35),
            height: (view.frame.size.width/2.1)
        )
    }
    
    // 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
