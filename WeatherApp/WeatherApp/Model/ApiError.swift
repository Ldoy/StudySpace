//
//  ApiError.swift
//  WeatherApp
//
//  Created by Do Yi Lee on 2021/04/20.
//

import Foundation

enum ApiError: Error {
    case unowned
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}
