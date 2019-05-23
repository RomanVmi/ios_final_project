//
//  PositionHeaderView.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 23/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit


class PositionHeaderCustomView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func setup(with image: UIImage, and title: String) {
//        self.titleLabel.text = event.title
//        self.bodyLabel.text = event.time
    }
    
}
