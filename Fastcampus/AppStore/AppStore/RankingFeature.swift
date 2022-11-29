//
//  RankingFeature.swift
//  AppStore
//
//  Created by 김재동 on 2022/09/18.
//

import Foundation

struct RankingFeature: Decodable {
    let title: String
    let description: String
    let isInPurchaseApp: Bool
}
