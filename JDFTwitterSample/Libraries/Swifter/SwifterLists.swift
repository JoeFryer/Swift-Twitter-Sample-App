//
//  SwifterLists.swift
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
    GET    lists/list

    Returns all lists the authenticating or specified user subscribes to, including their own. The user is specified using the user_id or screen_name parameters. If no user is given, the authenticating user is used.

    This method used to be GET lists in version 1.0 of the API and has been renamed for consistency with other call.

    A maximum of 100 results will be returned by this call. Subscribed lists are returned first, followed by owned lists. This means that if a user subscribes to 90 lists and owns 20 lists, this method returns 90 subscriptions and 10 owned lists. The reverse method returns owned lists first, so with reverse=true, 20 owned lists and 80 subscriptions would be returned. If your goal is to obtain every list a user owns or subscribes to, use GET lists/ownerships and/or GET lists/subscriptions instead.
    */
    func getListsSubscribedByUserWithReverse(reverse: Bool?, success: ((lists: [JSONValue]?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/list.json"

        var parameters = Dictionary<String, AnyObject>()
        if reverse {
            parameters["reverse"] = reverse!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(lists: json.array)
            return

            }, failure: failure)
    }

    func getListsSubscribedByUserWithID(userID: Int, reverse: Bool?, success: ((lists: [JSONValue]?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/list.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["userID"] = userID

        if reverse {
            parameters["reverse"] = reverse!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(lists: json.array)
            return

            }, failure: failure)
    }

    func getListsSubscribedByUserWithScreenName(screenName: String, reverse: Bool?, success: ((lists: [JSONValue]?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/list.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["screen_name"] = screenName

        if reverse {
            parameters["reverse"] = reverse!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(lists: json.array)
            return

            }, failure: failure)
    }

    /*
    GET	lists/statuses

    Returns a timeline of tweets authored by members of the specified list. Retweets are included by default. Use the include_rts=false parameter to omit retweets. Embedded Timelines is a great way to embed list timelines on your website.
    */
    func getListsStatusesWithListID(listID: Int, ownerScreenName: String, sinceID: Int?, maxID: Int?, count: Int?, includeEntities: Bool?, includeRTs: Bool?, success: ((statuses: [JSONValue]?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/statuses.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        parameters["owner_screen_name"] = ownerScreenName

        if sinceID {
            parameters["since_id"] = sinceID!
        }
        if maxID {
            parameters["max_id"] = maxID!
        }
        if count {
            parameters["count"] = count!
        }
        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if includeRTs {
            parameters["include_rts"] = includeRTs!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(statuses: json.array)
            return

            }, failure: failure)
    }

    func getListsStatuesWithListID(listID: Int, ownerID: Int, sinceID: Int?, maxID: Int?, count: Int?, includeEntities: Bool?, includeRTs: Bool?, success: ((statuses: [JSONValue]?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/statuses.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        parameters["owner_id"] = ownerID

        if sinceID {
            parameters["since_id"] = sinceID!
        }
        if maxID {
            parameters["max_id"] = maxID!
        }
        if count {
            parameters["count"] = count!
        }
        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if includeRTs {
            parameters["include_rts"] = includeRTs!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(statuses: json.array)
            return

            }, failure: failure)
    }

    func getListsStatuesWithSlug(slug: String, ownerScreenName: String, sinceID: Int?, maxID: Int?, count: Int?, includeEntities: Bool?, includeRTs: Bool?, success: ((statuses: [JSONValue]?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/statuses.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_screen_name"] = ownerScreenName

        if sinceID {
            parameters["since_id"] = sinceID!
        }
        if maxID {
            parameters["max_id"] = maxID!
        }
        if count {
            parameters["count"] = count!
        }
        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if includeRTs {
            parameters["include_rts"] = includeRTs!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(statuses: json.array)
            return

            }, failure: failure)
    }

    func getListsStatuesWithSlug(slug: String, ownerID: Int, sinceID: Int?, maxID: Int?, count: Int?, includeEntities: Bool?, includeRTs: Bool?, success: ((statuses: [JSONValue]?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/statuses.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_id"] = ownerID

        if sinceID {
            parameters["since_id"] = sinceID!
        }
        if maxID {
            parameters["max_id"] = maxID!
        }
        if count {
            parameters["count"] = count!
        }
        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if includeRTs {
            parameters["include_rts"] = includeRTs!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(statuses: json.array)
            return

            }, failure: failure)
    }

    /*
    POST	lists/members/destroy

    Removes the specified member from the list. The authenticated user must be the list's owner to remove members from the list.
    */
    func postListsMembersDestroyWithListID(listID: Int, userID: Int, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        parameters["user_id"] = userID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersDestroyWithListID(listID: Int, screenName: String, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        parameters["screen_name"] = screenName

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersDestroyWithSlug(slug: String, userID: Int, ownerScreenName: String, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["userID"] = userID
        parameters["owner_screen_name"] = ownerScreenName

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersDestroyWithSlug(slug: String, screenName: String, ownerScreenName: String, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["screen_name"] = screenName
        parameters["owner_screen_name"] = ownerScreenName

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersDestroyWithSlug(slug: String, userID: Int, ownerID: Int, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["userID"] = userID
        parameters["owner_id"] = ownerID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersDestroyWithSlug(slug: String, screenName: String, ownerID: Int, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["screen_name"] = screenName
        parameters["owner_id"] = ownerID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    /*
    GET    lists/memberships

    Returns the lists the specified user has been added to. If user_id or screen_name are not provided the memberships for the authenticating user are returned.
    */
    func getListsMembershipsWithUserID(userID: Int, cursor: Int?, filterToOwnedLists: Bool?, success: ((lists: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/memberships.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["user_id"] = userID

        if cursor {
            parameters["cursor"] = cursor!
        }
        if filterToOwnedLists {
            parameters["filter_to_owned_lists"] = filterToOwnedLists!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["lists"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let lists, let previousCursor, let nextCursor):
                success?(lists: lists, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(lists: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    func getListsMembershipsWithScreenName(screenName: String, cursor: Int?, filterToOwnedLists: Bool?, success: ((lists: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/memberships.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["screen_name"] = screenName

        if cursor {
            parameters["cursor"] = cursor!
        }
        if filterToOwnedLists {
            parameters["filter_to_owned_lists"] = filterToOwnedLists!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["lists"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let lists, let previousCursor, let nextCursor):
                success?(lists: lists, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(lists: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    /*
    GET	lists/subscribers

    Returns the subscribers of the specified list. Private list subscribers will only be shown if the authenticated user owns the specified list.
    */
    func getListsSubscribersWithListID(listID: Int, ownerScreenName: String?, cursor: Int?, includeEntities: Bool?, skipStatus: Bool?, success: ((users: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        if ownerScreenName {
            parameters["owner_screen_name"] = ownerScreenName!
        }
        if cursor {
            parameters["cursor"] = cursor!
        }
        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
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

    func getListsSubscribersWithListID(listID: Int, ownerID: Int?, cursor: Int?, includeEntities: Bool?, skipStatus: Bool?, success: ((users: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        if ownerID {
            parameters["owner_id"] = ownerID!
        }
        if cursor {
            parameters["cursor"] = cursor!
        }
        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
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

    func getListsSubscribersWithSlug(slug: String, ownerScreenName: String?, cursor: Int?, includeEntities: Bool?, skipStatus: Bool?, success: ((users: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        if ownerScreenName {
            parameters["owner_screen_name"] = ownerScreenName!
        }
        if cursor {
            parameters["cursor"] = cursor!
        }
        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
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

    func getListsSubscribersWithSlug(slug: String, ownerID: Int?, cursor: Int?, includeEntities: Bool?, skipStatus: Bool?, success: ((users: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        if ownerID {
            parameters["owner_id"] = ownerID!
        }
        if cursor {
            parameters["cursor"] = cursor!
        }
        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
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
    POST	lists/subscribers/create

    Subscribes the authenticated user to the specified list.
    */
    func postListsSubscribersCreateWithListID(listID: Int, ownerScreenName: String, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/create.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["owner_screen_name"] = ownerScreenName
        parameters["list_id"] = listID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func postListsSubscribersCreateWithListID(listID: Int, ownerID: Int, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/create.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["owner_id"] = ownerID
        parameters["list_id"] = listID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func postListsSubscribersCreateWithSlug(slug: String, ownerScreenName: String, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/create.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["owner_screen_name"] = ownerScreenName
        parameters["slug"] = slug

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func postListsSubscribersCreateWithSlug(slug: String, ownerID: Int, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/create.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["owner_id"] = ownerID
        parameters["slug"] = slug

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    /*
    GET	lists/subscribers/show

    Check if the specified user is a subscriber of the specified list. Returns the user if they are subscriber.
    */
    func getListsSubscribersShowWithListID(listID: Int, userID: Int, includeEntities: Bool?, skipStatus: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        parameters["user_id"] = userID

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func getListsSubscribersShowWithListID(listID: Int, screenName: String, includeEntities: Bool?, skipStatus: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        parameters["screen_name"] = screenName

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func getListsSubscribersShowWithSlug(slug: String, ownerID: Int, userID: Int, includeEntities: Bool?, skipStatus: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_id"] = ownerID
        parameters["user_id"] = userID

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func getListsSubscribersShowWithSlug(slug: String, ownerID: Int, screenName: Int, includeEntities: Bool?, skipStatus: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_id"] = ownerID
        parameters["screen_name"] = screenName

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func getListsSubscribersShowWithSlug(slug: String, ownerScreenName: Int, userID: Int, includeEntities: Bool?, skipStatus: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_screen_name"] = ownerScreenName
        parameters["user_id"] = userID

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func getListsSubscribersShowWithSlug(slug: String, ownerScreenName: Int, screenName: Int, includeEntities: Bool?, skipStatus: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_screen_name"] = ownerScreenName
        parameters["screen_name"] = screenName

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    /*
    POST	lists/subscribers/destroy

    Unsubscribes the authenticated user from the specified list.
    */
    func postListsSubscribersDestroyWithListID(listID: Int, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["listID"] = listID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func postListsSubscribersDestroyWithSlug(slug: String, ownerScreenName: String, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_screen_name"] = ownerScreenName

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func postListsSubscribersDestroyWithSlug(slug: String, ownerID: Int, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_id"] = ownerID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    /*
    POST	lists/members/create_all

    Adds multiple members to a list, by specifying a comma-separated list of member ids or screen names. The authenticated user must own the list to be able to add members to it. Note that lists can't have more than 5,000 members, and you are limited to adding up to 100 members to a list at a time with this method.

    Please note that there can be issues with lists that rapidly remove and add memberships. Take care when using these methods such that you are not too rapidly switching between removals and adds on the same list.
    */
    func postListsMembersCreateWithListID(listID: Int, userIDs: [Int], includeEntities: Bool?, skipStatus: Bool?, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/create_all.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        parameters["user_id"] = userIDs.bridgeToObjectiveC().componentsJoinedByString(",")

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersCreateWithListID(listID: Int, screenNames: [String], includeEntities: Bool?, skipStatus: Bool?, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/create_all.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        parameters["screen_name"] = screenNames.bridgeToObjectiveC().componentsJoinedByString(",")

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersCreateWithSlug(slug: String, ownerID: Int, userIDs: [Int], includeEntities: Bool?, skipStatus: Bool?, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/create_all.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_id"] = ownerID
        parameters["user_id"] = userIDs.bridgeToObjectiveC().componentsJoinedByString(",")

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersCreateWithSlug(slug: String, ownerID: Int, screenNames: [String], includeEntities: Bool?, skipStatus: Bool?, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/create_all.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_id"] = ownerID
        parameters["screen_name"] = screenNames.bridgeToObjectiveC().componentsJoinedByString(",")

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersCreateWithSlug(slug: String, ownerScreenName: String, userIDs: [Int], includeEntities: Bool?, skipStatus: Bool?, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/create_all.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_screen_name"] = ownerScreenName
        parameters["user_id"] = userIDs.bridgeToObjectiveC().componentsJoinedByString(",")

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersCreateWithSlug(slug: String, ownerScreenName: String, screenNames: [String], includeEntities: Bool?, skipStatus: Bool?, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/create_all.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_screen_name"] = ownerScreenName
        parameters["screen_name"] = screenNames.bridgeToObjectiveC().componentsJoinedByString(",")

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    /*
    GET	lists/members/show

    Check if the specified user is a member of the specified list.
    */
    func getListsMembersShowWithListID(listID: Int, userID: Int, includeEntities: Bool?, skipStatus: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        parameters["user_id"] = userID

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func getListsMembersShowWithListID(listID: Int, screenName: String, includeEntities: Bool?, skipStatus: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        parameters["screen_name"] = screenName

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func getListsMembersShowWithSlug(slug: String, ownerID: Int, userID: Int, includeEntities: Bool?, skipStatus: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_id"] = ownerID
        parameters["user_id"] = userID

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func getListsMembersShowWithSlug(slug: String, ownerID: Int, screenName: Int, includeEntities: Bool?, skipStatus: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_id"] = ownerID
        parameters["screen_name"] = screenName

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func getListsMembersShowWithSlug(slug: String, ownerScreenName: Int, userID: Int, includeEntities: Bool?, skipStatus: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_screen_name"] = ownerScreenName
        parameters["user_id"] = userID

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    /*
    GET    lists/members

    Returns the members of the specified list. Private list members will only be shown if the authenticated user owns the specified list.
    */
    func getListsMembersShowWithSlug(slug: String, ownerScreenName: Int, screenName: Int, includeEntities: Bool?, skipStatus: Bool?, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_screen_name"] = ownerScreenName
        parameters["screen_name"] = screenName

        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func getListsMembersWithListID(listID: Int, ownerScreenName: String?, cursor: Int?, includeEntities: Bool?, skipStatus: Bool?, success: ((users: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        if ownerScreenName {
            parameters["owner_screen_name"] = ownerScreenName!
        }
        if cursor {
            parameters["cursor"] = cursor!
        }
        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
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

    func getListsMembersWithListID(listID: Int, ownerID: Int?, cursor: Int?, includeEntities: Bool?, skipStatus: Bool?, success: ((users: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        if ownerID {
            parameters["owner_id"] = ownerID!
        }
        if cursor {
            parameters["cursor"] = cursor!
        }
        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
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

    func getListsMembersWithSlug(slug: String, ownerScreenName: String?, cursor: Int?, includeEntities: Bool?, skipStatus: Bool?, success: ((users: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        if ownerScreenName {
            parameters["owner_screen_name"] = ownerScreenName!
        }
        if cursor {
            parameters["cursor"] = cursor!
        }
        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
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

    func getListsMembersWithSlug(slug: String, ownerID: Int?, cursor: Int?, includeEntities: Bool?, skipStatus: Bool?, success: ((users: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        if ownerID {
            parameters["owner_id"] = ownerID!
        }
        if cursor {
            parameters["cursor"] = cursor!
        }
        if includeEntities {
            parameters["include_entities"] = includeEntities!
        }
        if skipStatus {
            parameters["skip_status"] = skipStatus!
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
    POST	lists/members/create

    Creates a new list for the authenticated user. Note that you can't create more than 20 lists per account.
    */
    func postListsMembersCreateWithListID(listID: Int, ownerScreenName: String, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/create.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["owner_screen_name"] = ownerScreenName
        parameters["list_id"] = listID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func postListsMembersCreateWithListID(listID: Int, ownerID: Int, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/create.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["owner_id"] = ownerID
        parameters["list_id"] = listID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func postListsMembersCreateWithSlug(slug: String, ownerScreenName: String, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/create.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["owner_screen_name"] = ownerScreenName
        parameters["slug"] = slug

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    func postListsMembersCreateWithSlug(slug: String, ownerID: Int, success: ((user: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscribers/create.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["owner_id"] = ownerID
        parameters["slug"] = slug

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(user: json.object)
            return

            }, failure: failure)
    }

    /*
    POST	lists/destroy

    Deletes the specified list. The authenticated user must own the list to be able to destroy it.
    */
    func postListsDestroyWithListID(listID: Int, success: ((list: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(list: json.object)
            return

            }, failure: failure)
    }

    func postListsDestroyWithSlug(slug: String, ownerID: Int, success: ((list: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_id"] = ownerID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(list: json.object)
            return

            }, failure: failure)
    }

    func postListsDestroyWithSlug(slug: String, ownerScreenName: String, success: ((list: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/destroy.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_screen_name"] = ownerScreenName

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(list: json.object)
            return

            }, failure: failure)
    }

    /*
    POST	lists/update

    Updates the specified list. The authenticated user must own the list to be able to update it.
    */
    func postListsUpdateWithListID(listID: Int, name: String?, public: Bool?, description: String?, success: ((list: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/update.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID

        if name {
            parameters["name"] = name!
        }
        if public {
            if public! {
                parameters["mode"] = "public"
            }
            else {
                parameters["mode"] = "private"
            }
        }
        if description {
            parameters["description"] = description!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(list: json.object)
            return

            }, failure: failure)
    }

    func postListsUpdateWithSlug(slug: String, ownerID: Int, name: String?, public: Bool?, description: String?, success: ((list: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/update.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_id"] = ownerID

        if name {
            parameters["name"] = name!
        }
        if public {
            if public! {
                parameters["mode"] = "public"
            }
            else {
                parameters["mode"] = "private"
            }
        }
        if description {
            parameters["description"] = description!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(list: json.object)
            return

            }, failure: failure)
    }

    func postListsUpdateWithSlug(slug: String, ownerScreenName: String, name: String?, public: Bool?, description: String?, success: ((list: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/update.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_screen_name"] = ownerScreenName

        if name {
            parameters["name"] = name!
        }
        if public {
            if public! {
                parameters["mode"] = "public"
            }
            else {
                parameters["mode"] = "private"
            }
        }
        if description {
            parameters["description"] = description!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(list: json.object)
            return

            }, failure: failure)
    }

    /*
    POST	lists/create

    Creates a new list for the authenticated user. Note that you can't create more than 20 lists per account.
    */
    func postListsCreateWithName(name: String, public: Bool?, description: String?, success: ((list: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/create.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["name"] = name

        if public {
            if public! {
                parameters["mode"] = "public"
            }
            else {
                parameters["mode"] = "private"
            }
        }
        if description {
            parameters["description"] = description!
        }

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(list: json.object)
            return

            }, failure: failure)
    }

    /*
    GET	lists/show

    Returns the specified list. Private lists will only be shown if the authenticated user owns the specified list.
    */
    func getListsShowWithID(listID: Int, success: ((list: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(list: json.object)
            return

            }, failure: failure)
    }

    func getListsShowWithSlug(slug: String, ownerID: Int, success: ((list: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_id"] = ownerID

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(list: json.object)
            return

            }, failure: failure)
    }

    func getListsShowWithSlug(slug: String, ownerScreenName: String, success: ((list: Dictionary<String, JSONValue>?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/show.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["owner_screen_name"] = ownerScreenName

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(list: json.object)
            return

            }, failure: failure)
    }

    /*
    GET	lists/subscriptions

    Obtain a collection of the lists the specified user is subscribed to, 20 lists per page by default. Does not include the user's own lists.
    */
    func getListsSubscriptionsWithUserID(userID: Int, count: Int?, cursor: Int?, success: ((lists: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscriptions.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["user_id"] = userID

        if count {
            parameters["count"] = count!
        }
        if cursor {
            parameters["cursor"] = cursor!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["lists"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let lists, let previousCursor, let nextCursor):
                success?(lists: lists, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(lists: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    func getListsSubscriptionsWithScreenName(screenName: String, count: Int?, cursor: Int?, success: ((lists: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/subscriptions.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["screen_name"] = screenName

        if count {
            parameters["count"] = count!
        }
        if cursor {
            parameters["cursor"] = cursor!
        }

        self.getJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            switch (json["lists"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let lists, let previousCursor, let nextCursor):
                success?(lists: lists, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(lists: nil, previousCursor: nil, nextCursor: nil)
            }

            }, failure: failure)
    }

    /*
    POST	lists/members/destroy_all

    Removes multiple members from a list, by specifying a comma-separated list of member ids or screen names. The authenticated user must own the list to be able to remove members from it. Note that lists can't have more than 500 members, and you are limited to removing up to 100 members to a list at a time with this method.

    Please note that there can be issues with lists that rapidly remove and add memberships. Take care when using these methods such that you are not too rapidly switching between removals and adds on the same list.
    */
    func postListsMembersDestroyAllWithListID(listID: Int, userIDs: [Int], success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/destroy_all.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        parameters["user_id"] = userIDs.bridgeToObjectiveC().componentsJoinedByString(",")

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersDestroyAllWithListID(listID: Int, screenNames: [String], success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/destroy_all.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["list_id"] = listID
        parameters["screen_name"] = screenNames.bridgeToObjectiveC().componentsJoinedByString(",")

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersDestroyAllWithSlug(slug: String, userIDs: [Int], ownerScreenName: String, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/destroy_all.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["userID"] = userIDs.bridgeToObjectiveC().componentsJoinedByString(",")
        parameters["owner_screen_name"] = ownerScreenName

        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in

            success?(response: json)
            return

            }, failure: failure)
    }

    func postListsMembersDestroyAllWithSlug(slug: String, screenNames: [String], ownerScreenName: String, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/destroy_all.json"

        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["screen_name"] = screenNames.bridgeToObjectiveC().componentsJoinedByString(",")
        parameters["owner_screen_name"] = ownerScreenName
        
        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in
            
            success?(response: json)
            return
            
            }, failure: failure)
    }
    
    func postListsMembersDestroyAllWithSlug(slug: String, userIDs: [Int], ownerID: Int, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/destroy_all.json"
        
        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["userID"] = userIDs.bridgeToObjectiveC().componentsJoinedByString(",")
        parameters["owner_id"] = ownerID
        
        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in
            
            success?(response: json)
            return
            
            }, failure: failure)
    }
    
    func postListsMembersDestroyAllWithSlug(slug: String, screenNames: [String], ownerID: Int, success: ((response: JSON?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/members/destroy_all.json"
        
        var parameters = Dictionary<String, AnyObject>()
        parameters["slug"] = slug
        parameters["screen_name"] = screenNames.bridgeToObjectiveC().componentsJoinedByString(",")
        parameters["owner_id"] = ownerID
        
        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in
            
            success?(response: json)
            return
            
            }, failure: failure)
    }
    
    /*
    GET    lists/ownerships
    
    Returns the lists owned by the specified Twitter user. Private lists will only be shown if the authenticated user is also the owner of the lists.
    */
    func getListsOwnershipsWithUserID(userID: Int, count: Int?, cursor: Int?, success: ((lists: [JSONValue]?, previousCursor: Int?, nextCursor: Int?) -> Void)?, failure: FailureHandler?) {
        let path = "lists/ownerships.json"
        
        var parameters = Dictionary<String, AnyObject>()
        parameters["user_id"] = userID
        
        if count {
            parameters["count"] = count!
        }
        if cursor {
            parameters["cursor"] = cursor!
        }
        
        self.postJSONWithPath(path, baseURL: self.apiURL, parameters: parameters, uploadProgress: nil, downloadProgress: nil, success: {
            json, response in
            
            switch (json["lists"].array, json["previous_cursor"].integer, json["next_cursor"].integer) {
            case (let lists, let previousCursor, let nextCursor):
                success?(lists: lists, previousCursor: previousCursor, nextCursor: nextCursor)
            default:
                success?(lists: nil, previousCursor: nil, nextCursor: nil)
            }
            
            }, failure: failure)
        
    }
    
}
