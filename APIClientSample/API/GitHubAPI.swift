//
//  GitHubAPI.swift
//  APIClientSample
//
//  Created by 蜂谷庸正 on 2018/02/15.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import Foundation

final class GitHubAPI {
    struct SearchRepositories: GitHubRequest {
        let keyword: String
        
        typealias Response = SearchResponse<Repository>
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "/search/repositories"
        }
        
        var parameters: Any? {
            return ["q": keyword]
        }
    }
    
    struct SearchUsers: GitHubRequest {
        let keyword: String
        
        typealias Response = SearchResponse<User>
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "/search/users"
        }
        
        var parameters: Any? {
            return ["q": keyword]
        }
    }
}
