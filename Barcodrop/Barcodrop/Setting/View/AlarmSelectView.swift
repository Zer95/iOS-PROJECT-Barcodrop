//
//  AlarmSelectView.swift
//  Barcodrop
//
//  Created by SG on 2022/02/13.
//

import UIKit

class AlarmSelectView: UIView {
    
    let day0 = AlarmDayButton(title: "D-Day", tagIndex: 0)
    let day1 = AlarmDayButton(title: "D-1", tagIndex: 1)
    let day2 = AlarmDayButton(title: "D-2", tagIndex: 2)
    let day3 = AlarmDayButton(title: "D-3", tagIndex: 3)
    let day4 = AlarmDayButton(title: "D-4", tagIndex: 4)
    let day5 = AlarmDayButton(title: "D-5", tagIndex: 5)
    let day6 = AlarmDayButton(title: "D-6", tagIndex: 6)
    let day7 = AlarmDayButton(title: "D-7", tagIndex: 7)
    
    lazy var dayStackButton = UIStackView(arrangedSubviews: [day0,day1,day2,day3,day4,day5,day6,day7]).then {
        $0.axis = .vertical
        $0.spacing = 20
        $0.alignment = .leading
    }
    
    let datePicker = UIDatePicker().then {
        $0.backgroundColor = .clear
        $0.datePickerMode = .time
        $0.preferredDatePickerStyle = .wheels
        $0.locale = Locale(identifier: "ko-KR")
        $0.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        addSubview(dayStackButton)
        dayStackButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(24)
        }
        
        addSubview(datePicker)
        datePicker.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(24)
            $0.width.equalTo(160)
            $0.height.equalTo(390)
        }
        
    }
    
}
