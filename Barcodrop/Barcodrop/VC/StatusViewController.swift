//
//  StatusViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/01/22.
//

import UIKit

class StatusViewController: UIViewController {
    
    var lblTitle: UILabel = {
        var label = UILabel()
        label.textColor = #colorLiteral(red: 0.9058228135, green: 0.5184860229, blue: 0.3639512062, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 55.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        lblTitle.text = tabBarItem.title
        view.addSubview(lblTitle)

        lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lblTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.setNeedsLayout()
    }

    func inverseColor() {
        view.backgroundColor = lblTitle.textColor
        lblTitle.textColor = UIColor.white
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return view.backgroundColor == UIColor.white ? .default : .lightContent
    }
}
