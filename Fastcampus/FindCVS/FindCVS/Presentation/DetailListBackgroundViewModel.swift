//
//  DetailListBackgroundViewModel.swift
//  FindCVS
//
//  Created by 김재동 on 2022/11/07.
//

import RxSwift
import RxCocoa

struct DetailListBackgroundViewModel {
    let isStatusLabelHidden: Signal<Bool>
    let shouldHideStatusLabel = PublishSubject<Bool>()
    
    init() {
        isStatusLabelHidden = shouldHideStatusLabel
            .asSignal(onErrorJustReturn: true)
    }
}
