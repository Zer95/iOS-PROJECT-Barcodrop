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
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
    let unitsSold = [10.0, 4.0, 6.0, 3.0, 12.0, 16.0]
    let track = ["Frech", "Ice", "Room", "Etc"]
    let money = [650, 456.13, 78.67, 856.52]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        SettingChart()
    }
 
}


// MARK: - PieChart : Setting

extension StatusViewController {
    
    func SettingChart()  {
        
        let chart = PieChartView(frame: self.view.frame)
        var entries = [PieChartDataEntry]()
        
        for (index, value) in money.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = value
            entry.label = track[index]
            entries.append( entry)
        }
        
        let set = PieChartDataSet( entries: entries, label: "Pie Chart")
        let data = PieChartData(dataSet: set)
        chart.data = data
        chart.noDataText = "No data available"
        
        let colors = [UIColor(cgColor: #colorLiteral(red: 0.9349866509, green: 0.6843166351, blue: 0.7154654264, alpha: 1)),UIColor(cgColor: #colorLiteral(red: 0, green: 0.7157182097, blue: 0.9544565082, alpha: 1)),UIColor(cgColor: #colorLiteral(red: 0.4865615368, green: 0.9425002933, blue: 0.7065398097, alpha: 1)),UIColor(cgColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))]
        set.colors = colors
        
        chart.isUserInteractionEnabled = true
        
        // 범례 세팅
        let l = chart.legend
        l.enabled = true
        l.orientation = .horizontal
        l.form = .circle
        l.formSize = 10
        l.horizontalAlignment = .center
        
        chart.spin(duration: 2,
                                  fromAngle: chart.rotationAngle,
                                  toAngle: chart.rotationAngle + 360,
                                  easingOption: .easeInCubic)
        
        // Style
        chart.drawHoleEnabled = true // 차트 스타일 변경
        set.sliceSpace = 2 // 데이터 간격
        chart.centerText = "ALL"
        set.entryLabelFont = UIFont.systemFont(ofSize: 0.1, weight: .bold)
        set.valueFont = UIFont.systemFont(ofSize: 0.1, weight: .bold)
        
        // View OffSet
        self.view.addSubview(chart)
        chart.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(24)
            $0.width.equalTo(200)
            $0.height.equalTo(400)
        }
    }
    
}
