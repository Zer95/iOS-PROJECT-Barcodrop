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
    
    let listTableViewCell = "ListTableViewCell"
    
    let headerTipView = CategoryView().then {
        $0.snp.makeConstraints {
            $0.width.equalTo(device.screenWidth)
            $0.height.equalTo(400)
        }
    }
    
    lazy var categoryTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.separatorStyle = .none
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never // * safeArea 공백 제거
        $0.register(ListTableViewCell.self, forCellReuseIdentifier: listTableViewCell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configureUI()
    }
    
    func configureUI() {
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.backgroundColor = .white
        
        view.addSubview(categoryTableView)
        categoryTableView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
    }
    
}

// MARK: - TalbleView : categoryTableView


extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    //header Height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 400
    }
    
    //header View
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerTipView
    }
    
    // table Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constant.categoryList.count
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: listTableViewCell, for: indexPath) as! ListTableViewCell
        cell.categoryLabel.attributedText = settingLable(title: "\(Constant.categoryList[indexPath.row])",
                                                         imgName: "\(Constant.categoryImageList[indexPath.row])")
        return cell
    }
    
    // cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    
}
