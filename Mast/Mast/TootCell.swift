//
//  TootCell.swift
//  Mast
//
//  Created by Shihab Mehboob on 17/09/2019.
//  Copyright © 2019 Shihab Mehboob. All rights reserved.
//

import Foundation
import UIKit

class TootCell: UITableViewCell {
    
    var containerView = UIView()
    var title = UILabel()
    var title2 = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = GlobalStruct.baseTint
        containerView.layer.cornerRadius = 8
        containerView.alpha = 0
        contentView.addSubview(containerView)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor(named: "baseBlack")
        title.textAlignment = .natural
        title.font = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .body).pointSize)
        title.isUserInteractionEnabled = false
        title.numberOfLines = 3
        title.adjustsFontForContentSizeCategory = true
        title.numberOfLines = 0
        contentView.addSubview(title)
        
        title2.translatesAutoresizingMaskIntoConstraints = false
        title2.textColor = UIColor(named: "baseBlack")!.withAlphaComponent(0.8)
        title2.textAlignment = .natural
        title2.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .body).pointSize)
        title2.isUserInteractionEnabled = false
        title2.adjustsFontForContentSizeCategory = true
        title2.numberOfLines = 0
        contentView.addSubview(title2)
        
        let viewsDict = [
            "containerView" : containerView,
            "title" : title,
            "title2" : title2,
        ]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[containerView]-12-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[containerView]-2-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-18-[title]-18-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-18-[title2]-18-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[title]-2-[title2]-10-|", options: [], metrics: nil, views: viewsDict))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        containerView.backgroundColor = GlobalStruct.baseTint
    }
    
    func highlightCell() {
        springWithDelay(duration: 0.3, delay: 0, animations: {
            self.title.textColor = UIColor(named: "alwaysWhite")
            self.title2.textColor = UIColor(named: "alwaysWhite")?.withAlphaComponent(0.8)
            self.containerView.alpha = 1
        })
    }
    
    func unhighlightCell() {
        springWithDelay(duration: 0.3, delay: 0, animations: {
            self.title.textColor = UIColor(named: "baseBlack")
            self.title2.textColor = UIColor(named: "baseBlack")?.withAlphaComponent(0.8)
            self.containerView.alpha = 0
        })
    }
}
