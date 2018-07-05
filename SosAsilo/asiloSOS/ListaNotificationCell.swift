//
//  ListaNotificationCell.swift
//  asiloSOS
//
//  Created by Fabrício Wolff on 04/07/18.
//  Copyright © 2018 Apple Developer Academy. All rights reserved.
//

import UIKit

class ListaNotificationCell: UITableViewCell {

    @IBOutlet weak var photoNotification: UIImageView!
    @IBOutlet weak var titleNotification: UILabel!
    @IBOutlet weak var textNotification: UILabel!
    @IBOutlet weak var view: UIView!
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsetsMake(0, 16, 0, 16))
    }
    

//    func roundedPhoto() {
//        photoNotification.layer.masksToBounds = true
//        photoNotification.layer.cornerRadius = photoNotification.frame.width / 2
//    }
}
