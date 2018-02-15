//
//  ViewController.swift
//  APIClientSample
//
//  Created by 蜂谷庸正 on 2018/02/15.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyword = "swift"

        // APIクライアントの生成
        let apiClient = GitHubClient()
        // リクエストの発行
        let request = GitHubAPI.SearchRepositories(keyword: keyword)
        // リクエストの送信
        apiClient.send(request: request) { result in
            switch result {
            case let .success(response):
                for item in response.items {
                    // リポジトリの所有者と名前を出力
                    print(item.owner.login + "/" + item.name)
                }
            case let .failure(error):
                // エラーを出力
                print(error)
            }
        }
        
        // タイムアウト時間
        let timeoutInterval: TimeInterval = 60
        // タイムアウトまでメインスレッドを停止
        Thread.sleep(forTimeInterval: timeoutInterval)
        
        // タイムアウト後の処理
        print("Connection timeout!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

