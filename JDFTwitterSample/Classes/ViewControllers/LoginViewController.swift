//
//  LoginViewController.swift
//  JDFTwitterSample
//
//  Created by Joe Fryer on 12/07/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

import UIKit
import Accounts
import Social

let LoginViewControllerTwitterButtonEdgeLength: CGFloat = 100.0


class LoginViewController: UIViewController {
    
    var twitterButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.attemptLoginWarningIfDenied(false)
    }
    
    func setupView() {
        self.twitterButton = UIButton(frame: CGRectMake((self.view.frame.size.width / 2) - (LoginViewControllerTwitterButtonEdgeLength / 2), (self.view.frame.size.height / 2) - LoginViewControllerTwitterButtonEdgeLength, LoginViewControllerTwitterButtonEdgeLength, LoginViewControllerTwitterButtonEdgeLength))
        self.twitterButton!.setImage(UIImage(named: JDFTwitterSampleImageNameTwitterButton), forState: UIControlState.Normal)
        self.twitterButton!.addTarget(self, action:"twitterButtonPressed", forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(self.twitterButton)
    }
    
    func twitterButtonPressed() {
        self.attemptLoginWarningIfDenied(true)
    }
    
    func attemptLoginWarningIfDenied(warnIfDenied: Bool) {
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) {
            granted, error in
            
            if granted {
                let twitterAccounts = accountStore.accountsWithAccountType(accountType)
                
                if twitterAccounts {
                    if twitterAccounts.count == 0 {
                        self.alert("There are no Twitter accounts configured. You can add or create a Twitter account in Settings.")
                    } else {
                        let twitterAccount = twitterAccounts[0] as ACAccount
                        let swifter = Swifter(account: twitterAccount)
                        self.presentTimelineVCWithSwifter(swifter)
                    }
                } else {
                    self.alert("There are no Twitter accounts configured. You can add or create a Twitter account in Settings.")
                }
            } else if warnIfDenied {
                self.alert("You have denied JDFTwitterSample access to the Twitter Accounts. You can change this in Settings.")
            }
        }
    }
    
    func alert(message: String) {
        // This is the iOS8 way of doing alerts. For older versions, look into UIAlertView
        var alert = UIAlertController(
            title: nil,
            message: message,
            preferredStyle: UIAlertControllerStyle.Alert
        )
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func presentTimelineVCWithSwifter(swifter: Swifter) {
        let timeLineVC = TimelineViewController()
        let navigationController = UINavigationController(rootViewController: timeLineVC)
        timeLineVC.account = swifter
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
}
