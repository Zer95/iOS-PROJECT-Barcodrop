//
//  StatusViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/01/22.
//

import UIKit
import Charts
import SnapKit
import Then

class StatusViewController: UIViewController {
    
    // Temp Data
    let value = [1.0, 1.0, 1.0, 1.0] // Category Count Temp 값
    
    var pieChartView: PieChartView!
    let statusSideView = StatusSideView()
    let statusContentView = StatusContentView()
    let statusHistoryView = StatusHistoryView()
    
    let lineView = UIView().then {
        $0.backgroundColor = .orange
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        settingChart()
        configureUI()
    }
    
    func configureUI() {
        
        view.addSubview(pieChartView)
        pieChartView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.left.equalToSuperview().offset(24)
            $0.width.equalTo(200)
            $0.height.equalTo(300)
        }
        
        view.addSubview(statusSideView)
        statusSideView.snp.makeConstraints {
            $0.centerY.equalTo(pieChartView)
            $0.left.equalTo(pieChartView.snp.right).offset(50)
        }
        
        view.addSubview(lineView)
        lineView.snp.makeConstraints {
            $0.top.equalTo(pieChartView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        view.addSubview(statusContentView)
        statusContentView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        view.addSubview(statusHistoryView)
        statusHistoryView.snp.makeConstraints {
            $0.top.equalTo(statusContentView.snp.bottom).offset(10)
            $0.left.right.equalToSuperview()
        }
        
    }
    
}

// MARK: - PieChart : Setting

extension StatusViewController {
    
    func settingChart()  {
        
        pieChartView = PieChartView(frame: self.view.frame)
        var entries = [PieChartDataEntry]()
        
        for (index, value) in value.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = value
            entry.label = Constant.categoryList[index]
            entries.append(entry)
        }
        
        let set = PieChartDataSet( entries: entries, label: "")
        let data = PieChartData(dataSet: set)
        pieChartView.data = data
        pieChartView.noDataText = "No data available"
        
        let colors = [UIColor(cgColor: #colorLiteral(red: 0.9349866509, green: 0.6843166351, blue: 0.7154654264, alpha: 1)),UIColor(cgColor: #colorLiteral(red: 0, green: 0.7157182097, blue: 0.9544565082, alpha: 1)),UIColor(cgColor: #colorLiteral(red: 0.4865615368, green: 0.9425002933, blue: 0.7065398097, alpha: 1)),UIColor(cgColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))]
        set.colors = colors
        
        pieChartView.isUserInteractionEnabled = true
        
        // 범례 세팅
        let l = pieChartView.legend
        l.enabled = true
        l.orientation = .horizontal
        l.form = .circle
        l.formSize = 10
        l.horizontalAlignment = .center
        
        pieChartView.spin(duration: 2,
                          fromAngle: pieChartView.rotationAngle,
                          toAngle: pieChartView.rotationAngle + 360,
                          easingOption: .easeInCubic)
        
        // Style
        pieChartView.drawHoleEnabled = true // 차트 스타일 변경
        set.sliceSpace = 2 // 데이터 간격
        pieChartView.centerText = "ALL"
        set.entryLabelFont = UIFont.systemFont(ofSize: 0.1, weight: .bold)
        set.valueFont = UIFont.systemFont(ofSize: 0.1, weight: .bold)
      
        
    }
    
}
