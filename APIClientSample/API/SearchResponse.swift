//
//  SearchResponse.swift
//  APIClientSample
//
//  Created by 蜂谷庸正 on 2018/02/15.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import Foundation

struct SearchResponse<Item: JSONDecodable>: JSONDecodable {
    let totalCount: Int
    let items: [Item]
    
    init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let totalCount = dictionary["total_count"] as? Int else {
            throw JSONDecodeError.missingValue(key: "total_count", actualValue: dictionary["total_count"] ?? "")
        }
        
        guard let itemObject = dictionary["items"] as? [Any] else {
            throw JSONDecodeError.missingValue(key: "items", actualValue: dictionary["items"] ?? "")
        }
        
        let items = try itemObject.map {
            return try Item(json: $0)
        }
        
        self.totalCount = totalCount
        self.items = items
    }
}
