//
//  DiscountTableViewCell.swift
//  DiffableDataSource
//
//  Created by Saadet Şimşek on 12/08/2024.
//

import UIKit

class DiscountTableViewCell: UITableViewCell {

    static let identifier = "DiscountTableViewCell"
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none // hücre seçildiğinde bu görsel değişiklik olmaz
        addSubview(iconImageView)
        addSubview(nameLabel)
        
        addConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ model: DiscountModel) {
        iconImageView.image = UIImage(named: model.image)
        nameLabel.text = model.name
    }
    
    private func addConstraits(){
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            iconImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
    }

}
