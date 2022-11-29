//
//  FilterViewModel.swift
//  SearchDaumBlog
//
//  Created by 김재동 on 2022/10/24.
//

import RxSwift
import RxCocoa

struct FilterViewModel {
    let sortButtonTapped = PublishRelay<Void>()
}
