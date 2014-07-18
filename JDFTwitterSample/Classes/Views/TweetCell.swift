//
//  TweetCell.swift
//  JDFTwitterSample
//
//  Created by Joe Fryer on 13/07/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

import UIKit


class TweetCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView
    @IBOutlet var fullNameLabel: UILabel
    @IBOutlet var usernameLabel: UILabel
    @IBOutlet var tweetBodyLabel: UILabel
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.fullNameLabel.font = UIFont(name: "DINAlternate-Bold", size: 16.0)
        self.usernameLabel.font = UIFont(name: "ArialMT", size: 12.0)
        self.usernameLabel.textColor = UIColor.grayColor()
        self.tweetBodyLabel.font = UIFont(name: "AlNile", size: 12.0)
        self.tweetBodyLabel.numberOfLines = 0
        self.tweetBodyLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
        self.profileImageView.layer.masksToBounds = true
    }
}
