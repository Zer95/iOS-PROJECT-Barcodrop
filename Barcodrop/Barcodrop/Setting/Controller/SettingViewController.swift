//
//  SettingViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/01/22.
//

import UIKit

class SettingViewController: UIViewController {
    
    let settingTableViewCell = "SettingTableViewCell"
    
    let viewModel = SettingViewModel()
    
    let titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.text = "설정"
    }
    
    lazy var settingTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.separatorStyle = .none
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never // * safeArea 공백 제거
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .white
        $0.register(SettingTableViewCell.self, forCellReuseIdentifier: settingTableViewCell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configureUI()
    }
    
    private func configureUI() {
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        view.addSubview(settingTableView)
        settingTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
        }
    }
}

// MARK: - TalbleView : settingTableView

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            
        case 0:
            return viewModel.section1.count
        case 1:
            return viewModel.section2.count
        case 2:
            return viewModel.section3.count
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionModelList[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: settingTableViewCell) as! SettingTableViewCell
        
        cell.selectionStyle = .none
        
        switch indexPath.section {
            
        case 0:
            cell.contentLabel.text = viewModel.section1[indexPath.row].name
            cell.settingData = viewModel.section1[indexPath.row]
        case 1:
            cell.contentLabel.text = viewModel.section2[indexPath.row].name
            cell.settingData = viewModel.section2[indexPath.row]
        case 2:
            cell.contentLabel.text = viewModel.section3[indexPath.row].name
            cell.settingData = viewModel.section3[indexPath.row]
        default:
            cell.contentLabel.text = ""
        }
        
        return cell
    }
    
}


