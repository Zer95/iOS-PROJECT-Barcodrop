//
//  ListTableViewCell.swift
//  Barcodrop
//
//  Created by SG on 2022/02/06.
//

import UIKit
import SnapKit
import Then

class ListTableViewCell: UITableViewCell {
    
    let listCollectionViewCell = "ListCollectionViewCell"
    
    var nowRows = 0
    
    let categoryLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.textColor = .black
        $0.textAlignment = .natural
        $0.text = "냉장"
    }
    
    let listView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        
        // shadow
        $0.layer.masksToBounds = true
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 1, height: 1)
        $0.layer.shadowRadius = 3
        $0.layer.shadowOpacity = 2
        $0.layer.masksToBounds = false
    }
    
    let listHeaderItem = ListHeaderItem()
    
    lazy var listCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: listCollectionViewCell)
        $0.backgroundColor = .white
        $0.delegate = self
        $0.dataSource = self
    }
    
    private let layout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 10
        $0.itemSize = CGSize(width: 120, height: 170)
        $0.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.selectionStyle = .none
        self.backgroundColor = .white
        
        contentView.addSubview(categoryLabel)
        contentView.addSubview(listView)
        listView.addSubview(listHeaderItem)
        listView.addSubview(listCollectionView)
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(20)
            $0.left.equalToSuperview().offset(26)
        }
        
        listView.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(24)
            $0.right.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(24)
        }
        
        listHeaderItem.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
        
        listCollectionView.snp.makeConstraints {
            $0.top.equalTo(listHeaderItem.totalLabel.snp.bottom).offset(5)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
        
    }
    
}

// MARK: - CollectionView : listCollectionView

extension ListTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 데이터 셋팅
    func updateCellWith(index:Int, row: Int) {
        self.nowRows = row
        self.listCollectionView.reloadData()
        self.listCollectionView.setContentOffset(.zero, animated: false)
        
        if row  == 0 {
            listCollectionView.backgroundView = UIImageView(image: UIImage(named: "\(Constant.categoryImageList[index])"))
            listCollectionView.backgroundView?.contentMode = .scaleAspectFit
        } else {
            listCollectionView.backgroundView = UIImageView(image: nil)
        }
      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.nowRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = listCollectionView.dequeueReusableCell(withReuseIdentifier: listCollectionViewCell, for: indexPath) as! ListCollectionViewCell
        return cell
    }
    
}
