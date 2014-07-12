//
//  SwifterFollowers.swift
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

extension Swifter {

    /*
    GET    friendships/no_retweets/ids

    Returns a collection of user_ids that the currently authenticated user does not want to receive retweets from. Use POST friendships/update to set the "no retweets" status for a given user account on behalf of the current user.
    */
    func getFriendshipsNoRetweetsIDsWithStringifyIDs(stringifyIDs: Bool?, success: ((ids: [JSONValue]?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/no_retweets/ids.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["stringify_ids"] = stringifyIDs!

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(ids: json.array)
            return

            }, failure: failure)
    }

    /*
    GET    friends/ids
    Returns Users (*: user IDs for followees)

    Returns a cursored collection of user IDs for every user the specified user is following (otherwise known as their "friends").

    At this time, results are ordered with the most recent following first — however, this ordering is subject to unannounced change and eventual consistency issues. Results are given in groups of 5,000 user IDs and multiple "pages" of results can be navigated through using the next_cursor value in subsequent requests. See Using cursors to navigate collections for more information.

    This method is especially powerful when used in conjunction with GET users/lookup, a method that allows you to convert user IDs into full user objects in bulk.
    */
    func getFriendsIDsWithID(id: Int, cursor: Int?, stringifyIDs: Bool?, count: Int?, success: ((ids: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "friends/ids.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["id"] = id

        if cursor {
            parameters["cursor"] = cursor!
        }
        if stringifyIDs {
            parameters["stringify_ids"] = stringifyIDs!
        }
        if count {
            parameters["count"] = count!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["ids"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let ids, let previousCursor, let nextCursor):
                success?(ids: ids, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(ids: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    func getFriendsIDsWithScreenName(screenName: String, cursor: Int?, stringifyIDs: Bool?, count: Int?, success: ((ids: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "friends/ids.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["screen_name"] = screenName

        if cursor {
            parameters["cursor"] = cursor!
        }
        if stringifyIDs {
            parameters["stringify_ids"] = stringifyIDs!
        }
        if count {
            parameters["count"] = count!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["ids"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let ids, let previousCursor, let nextCursor):
                success?(ids: ids, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(ids: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    /*
    GET    followers/ids

    Returns a cursored collection of user IDs for every user following the specified user.

    At this time, results are ordered with the most recent following first — however, this ordering is subject to unannounced change and eventual consistency issues. Results are given in groups of 5,000 user IDs and multiple "pages" of results can be navigated through using the next_cursor value in subsequent requests. See Using cursors to navigate collections for more information.

    This method is especially powerful when used in conjunction with GET users/lookup, a method that allows you to convert user IDs into full user objects in bulk.
    */
    func getFollowersIDsWithID(id: Int, cursor: Int?, stringifyIDs: Bool?, count: Int?, success: ((ids: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "followers/ids.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["id"] = id

        if cursor {
            parameters["cursor"] = cursor!
        }
        if stringifyIDs {
            parameters["stringify_ids"] = stringifyIDs!
        }
        if count {
            parameters["count"] = count!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["ids"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let ids, let previousCursor, let nextCursor):
                success?(ids: ids, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(ids: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    func getFollowersIDsWithScreenName(screenName: String, cursor: Int?, stringifyIDs: Bool?, count: Int?, success: ((ids: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "followers/ids.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["screen_name"] = screenName

        if cursor {
            parameters["cursor"] = cursor!
        }
        if stringifyIDs {
            parameters["stringify_ids"] = stringifyIDs!
        }
        if count {
            parameters["count"] = count!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["ids"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let ids, let previousCursor, let nextCursor):
                success?(ids: ids, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(ids: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    /*
    GET    friendships/incoming

    Returns a collection of numeric IDs for every user who has a pending request to follow the authenticating user.
    */
    func getFriendshipsIncomingWithCursor(cursor: String?, stringifyIDs: String?, success: ((ids: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/incoming.json"

        var parameters = Dictionary<String, AnyObject>()
        if cursor {
            parameters["cursor"] = cursor!
        }
        if stringifyIDs {
            parameters["stringify_urls"] = stringifyIDs!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["ids"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let ids, let previousCursor, let nextCursor):
                success?(ids: ids, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(ids: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    /*
    GET    friendships/outgoing

    Returns a collection of numeric IDs for every protected user for whom the authenticating user has a pending follow request.
    */
    func getFriendshipsOutgoingWithCursor(cursor: String?, stringifyIDs: String?, success: ((ids: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/outgoing.json"

        var parameters = Dictionary<String, AnyObject>()
        if cursor {
            parameters["cursor"] = cursor!
        }
        if stringifyIDs {
            parameters["stringify_urls"] = stringifyIDs!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["ids"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let ids, let previousCursor, let nextCursor):
                success?(ids: ids, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(ids: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    /*
    POST   friendships/create

    Allows the authenticating users to follow the user specified in the ID parameter.

    Returns the befriended user in the requested format when successful. Returns a string describing the failure condition when unsuccessful. If you are already friends with the user a HTTP 403 may be returned, though for performance reasons you may get a 200 OK message even if the friendship already exists.

    Actions taken in this method are asynchronous and changes will be eventually consistent.
    */
    func postCreateFriendshipWithID(id: Int, follow: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/create.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["id"] = id

        if follow {
            parameters["follow"] = follow!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func postCreateFriendshipWithScreenName(screenName: String, follow: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/create.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["screen_name"] = screenName

        if follow {
            parameters["follow"] = follow!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    /*
    POST	friendships/destroy

    Allows the authenticating user to unfollow the user specified in the ID parameter.

    Returns the unfollowed user in the requested format when successful. Returns a string describing the failure condition when unsuccessful.

    Actions taken in this method are asynchronous and changes will be eventually consistent.
    */
    func postDestroyFriendshipWithID(id: Int, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["id"] = id

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func postDestroyFriendshipWithScreenName(screenName: String, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["screen_name"] = screenName

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    /*
    POST	friendships/update

    Allows one to enable or disable retweets and device notifications from the specified user.
    */
    func postUpdateFriendshipWithID(id: Int, device: Bool?, retweets: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/update.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["id"] = id

        if device {
            parameters["device"] = device!
        }
        if retweets {
            parameters["retweets"] = retweets!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func postUpdateFriendshipWithScreenName(screenName: String, device: Bool?, retweets: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/update.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["screen_name"] = screenName

        if device {
            parameters["device"] = device!
        }
        if retweets {
            parameters["retweets"] = retweets!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    /*
    GET    friendships/show

    Returns detailed information about the relationship between two arbitrary users.
    */
    func getFriendshipsShowWithSourceID(sourceID: Int?, targetID: Int?, orTargetScreenName targetScreenName: String?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["source_id"] = sourceID!

        if targetID {
            parameters["target_id"] = targetID!
        }
        else if targetScreenName {
            parameters["targetScreenName"] = targetScreenName!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func getFriendshipsShowWithSourceScreenName(sourceScreenName: String?, targetID: Int?, orTargetScreenName targetScreenName: String?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["source_screen_name"] = sourceScreenName!

        if targetID {
            parameters["target_id"] = targetID!
        }
        else if targetScreenName {
            parameters["targetScreenName"] = targetScreenName!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    /*
    GET    friends/list

    Returns a cursored collection of user objects for every user the specified user is following (otherwise known as their "friends").

    At this time, results are ordered with the most recent following first — however, this ordering is subject to unannounced change and eventual consistency issues. Results are given in groups of 20 users and multiple "pages" of results can be navigated through using the next_cursor value in subsequent requests. See Using cursors to navigate collections for more information.
    */
    func getFriendsListWithID(id: Int, cursor: Int?, count: Int?, skipStatus: Bool?, includeUserEntities: Bool?, success: ((users: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/list.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["id"] = id

        if cursor {
            parameters["cursor"] = cursor!
        }
        if count {
            parameters["count"] = count!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }
        if includeUserEntities {
            parameters["include_user_entities"] = includeUserEntities!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["users"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let users, let previousCursor, let nextCursor):
                success?(users: users, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(users: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    func getFriendsListWithScreenName(screenName: String, cursor: Int?, count: Int?, skipStatus: Bool?, includeUserEntities: Bool?, success: ((users: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "friendships/list.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["screen_name"] = screenName

        if cursor {
            parameters["cursor"] = cursor!
        }
        if count {
            parameters["count"] = count!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }
        if includeUserEntities {
            parameters["include_user_entities"] = includeUserEntities!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["users"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let users, let previousCursor, let nextCursor):
                success?(users: users, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(users: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    /*
    GET    followers/list

    Returns a cursored collection of user objects for users following the specified user.

    At this time, results are ordered with the most recent following first — however, this ordering is subject to unannounced change and eventual consistency issues. Results are given in groups of 20 users and multiple "pages" of results can be navigated through using the next_cursor value in subsequent requests. See Using cursors to navigate collections for more information.
    */
    func getFollowersListWithID(id: Int, cursor: Int?, count: Int?, skipStatus: Bool?, includeUserEntities: Bool?, success: ((users: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "followers/list.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["id"] = id

        if cursor {
            parameters["cursor"] = cursor!
        }
        if count {
            parameters["count"] = count!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }
        if includeUserEntities {
            parameters["include_user_entities"] = includeUserEntities!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["users"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let users, let previousCursor, let nextCursor):
                success?(users: users, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(users: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    func getFollowersListWithScreenName(screenName: String, cursor: Int?, count: Int?, skipStatus: Bool?, includeUserEntities: Bool?, success: ((users: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "followers/list.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["screen_name"] = screenName

        if cursor {
            parameters["cursor"] = cursor!
        }
        if count {
            parameters["count"] = count!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }
        if includeUserEntities {
            parameters["include_user_entities"] = includeUserEntities!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["users"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let users, let previousCursor, let nextCursor):
                success?(users: users, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(users: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    /*
    GET    friendships/lookup

    Returns the relationships of the authenticating user to the comma-separated list of up to 100 screen_names or user_ids provided. Values for connections can be: following, following_requested, followed_by, none.
    */
    func getFriendshipsLookupWithScreenNames(screenNames: [String], success: ((friendships: [JSONValue]?) -> Void)?, failure: FailureHandler?) {
        let path = "followers/lookup.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["screen_name"] = screenNames.bridgeToObjectiveC().componentsJoinedByString(",")

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in
            
            success?(friendships: json.array)
            return
            
            }, failure: failure)
    }
    
    func getFriendshipsLookupWithIDs(ids: [Int], success: ((friendships: [JSONValue]?) -> Void)?, failure: FailureHandler?) {
        let path = "followers/lookup.json"
        
        var parameters = Dictionary<String, AnyObject>()
        parameters["id"] = ids.bridgeToObjectiveC().componentsJoinedByString(",")
        
        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in
            
            success?(friendships: json.array)
            return
            
            }, failure: failure)
    }
    
}
