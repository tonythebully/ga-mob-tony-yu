//
//  ProfileTableViewCell.swift
//  Star Chaser
//
//  Created by Tony Yu on 7/05/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePictureImageView: UIImageView! {
        didSet {
            profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.height/2
        }
    }
    @IBOutlet weak var maintitleTextLabel: UILabel!
    @IBOutlet weak var subtitleTextLabel: UILabel!
    
    

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.size.height/2
//    }

//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
