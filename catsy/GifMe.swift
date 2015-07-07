//
//  GifsAPI.swift
//  catsy
//
//  Created by Mobile Developer on 7/07/15.
//  Copyright (c) 2015 Juan Felipe Carrera Moya. All rights reserved.
//

import Foundation
import Moya


let APIKey =  "rX7kbMzkGu7WJwvG"
let GifsProvider = MoyaProvider<GifMe>()


private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}

public enum GifMe {
    case ListFunnyCats(Int)
}

extension GifMe: MoyaTarget
{
    public var baseURL: NSURL { return NSURL(string: "http://api.gifme.io/v1")! }
    public var path: String {
        switch self {
            case .ListFunnyCats(let limit):
                return "/search"
        }
    }
    
    public var method : Moya.Method {
        return .GET
    }
    
    public var parameters: [String:AnyObject] {
        switch self {
            case .ListFunnyCats(let limit):
                return [
                            "page" : "0",
                            "query" : "funny+cats",
                            "limit" : limit,
                            "key" : APIKey
                        ]
        }
    }
    
    public var sampleData: NSData {
        switch self {
        case .ListFunnyCats(let limit):
                return "{}".dataUsingEncoding(NSUTF8StringEncoding)!
            
        }
    }
}

public func url(route: MoyaTarget) -> String {
    return route.baseURL.URLByAppendingPathComponent(route.path).absoluteString!
}


