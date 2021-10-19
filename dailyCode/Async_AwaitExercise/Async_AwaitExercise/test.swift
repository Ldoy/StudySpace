//
//  test.swift
//  Async_AwaitExercise
//
//  Created by Do Yi Lee on 2021/10/03.
//

import Foundation

class NetworkManager {
    func request(_ session: URLSession) {
        let reqeust = URLRequest(url: URL(string:  "https://images.unsplash.com/photo-1506619216599-9d16d0903dfd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1738&q=80")!)
        let task = session.dataTask(with: reqeust)
        task.resume()
    }
}
