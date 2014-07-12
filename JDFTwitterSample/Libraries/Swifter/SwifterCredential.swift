//
//  SwifterCredential.swift
//  Swifter
//
//  Copyright (c) 2014 Matt Donnelly.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import Accounts

class SwifterCredential {

    struct OAuthAccessToken {

        var key: String
        var secret: String
        var verifier: String?

        var screenName: String?
        var userID: String?

        init(key: String, secret: String) {
            self.key = key
            self.secret = secret
        }

        init(queryString: String) {
            var attributes = queryString.parametersFromQueryString()

            self.key = attributes["oauth_token"]!
            self.secret = attributes["oauth_token_secret"]!

            self.screenName = attributes["screen_name"]
            self.userID = attributes["user_id"]
        }
        
    }

    var accessToken: OAuthAccessToken?
    var account: ACAccount?

    init(accessToken: OAuthAccessToken) {
        self.accessToken = accessToken
    }

    init(account: ACAccount) {
        self.account = account
    }

}
