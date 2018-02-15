//
//  JSONDecodeError.swift
//  APIClientSample
//
//  Created by 蜂谷庸正 on 2018/02/15.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import Foundation

enum JSONDecodeError: Error {
    case invalidFormat(json: Any)
    case missingValue(key: String, actualValue: Any)
}
