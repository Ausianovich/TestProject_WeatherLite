//
//  SectionTableViewCell.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 27.02.2021.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    //MARK: - Properties
    
    lazy var sectionTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Main methods

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .lightGray
        self.setSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setSubviews() {
        self.contentView.addSubview(self.sectionTitle)
        self.activateConstraints()
    }
    
    func activateConstraints(){
        NSLayoutConstraint.activate([
            self.sectionTitle.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            self.sectionTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.sectionTitle.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            self.sectionTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
    }
    
    func configure(with title: String) {
        self.sectionTitle.text = title
        self.sectionTitle.tintColor = .white
    }
}
