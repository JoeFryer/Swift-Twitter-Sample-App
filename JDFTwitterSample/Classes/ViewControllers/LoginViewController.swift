//
//  LoginViewController.swift
//  JDFTwitterSample
//
//  Created by Joe Fryer on 12/07/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

import UIKit

let LoginViewControllerTwitterButtonEdgeLength: CGFloat = 100.0


class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    func setupView() {
        let twitterButton = UIButton(frame: CGRectMake((self.view.frame.size.width / 2) - (LoginViewControllerTwitterButtonEdgeLength / 2), (self.view.frame.size.height / 2) - LoginViewControllerTwitterButtonEdgeLength, LoginViewControllerTwitterButtonEdgeLength, LoginViewControllerTwitterButtonEdgeLength))
        twitterButton.setImage(UIImage(named: JDFTwitterSampleImageNameTwitterButton), forState: UIControlState.Normal)
        twitterButton.addTarget(self, action:"twitterButtonPressed", forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(twitterButton)
    }
    
    func twitterButtonPressed() {
        println("Twitter button pressed")
    }
}



