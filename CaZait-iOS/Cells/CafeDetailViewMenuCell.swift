//
//  CafeDetailViewMenuCell.swift
//  CaZait-iOS
//
//  Created by J on 2023/05/18.
//

import UIKit

class CafeDetailViewMenuCell: UITableViewCell {

    private let menuImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        
        if let coffeeImage = UIImage(named: "coffee1") {
            image.image = coffeeImage
        }
        
        return image
    }()

    
    private let menu: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "아메리카노"
        label.numberOfLines = 1
        
        return label
    }()
    
    private let price: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .left
        label.text = "3500원"
        label.numberOfLines = 1
        
        return label
    }()
    
    private let menuDescription: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "우리나라 원두를 사용하여 더욱 달달한 풍미가 살아있는 아메리카노"
        label.numberOfLines = 0 // 자동으로 줄 수 결정

        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        // 셀의 설정을 수행합니다.
        backgroundColor = .white
    }

    private func addSubviews() {
        // 셀에 서브뷰들을 추가합니다.
        contentView.addSubview(menuImage)
        contentView.addSubview(menu)
        contentView.addSubview(price)
        contentView.addSubview(menuDescription)
    }

    private func setupLayout() {
        // 서브뷰들의 레이아웃을 설정합니다.
        menuImage.translatesAutoresizingMaskIntoConstraints = false
        menu.translatesAutoresizingMaskIntoConstraints = false
        price.translatesAutoresizingMaskIntoConstraints = false
        menuDescription.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            menuImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            menuImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            menuImage.widthAnchor.constraint(equalToConstant: 80),
            menuImage.heightAnchor.constraint(equalToConstant: 80),

            menu.leadingAnchor.constraint(equalTo: menuImage.trailingAnchor, constant: 20),
            menu.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),

            price.leadingAnchor.constraint(equalTo: menu.trailingAnchor, constant: 20),
            price.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),

            menuDescription.leadingAnchor.constraint(equalTo: menuImage.trailingAnchor, constant: 20),
            menuDescription.topAnchor.constraint(equalTo: menu.bottomAnchor, constant: 8),
            menuDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    func configure(menuImage: UIImage?, menu: String, price: String, menuDescription: String) {
        // 셀의 내용을 설정합니다.
        self.menuImage.image = menuImage
        self.menu.text = menu
        self.price.text = price
        self.menuDescription.text = description
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
}
