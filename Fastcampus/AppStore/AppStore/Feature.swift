//
//  Feature.swift
//  AppStore
//
//  Created by 김재동 on 2022/09/18.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
