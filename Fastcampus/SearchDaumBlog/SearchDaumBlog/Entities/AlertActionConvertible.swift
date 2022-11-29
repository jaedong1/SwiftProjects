//
//  AlertActionConvertible.swift
//  SearchDaumBlog
//
//  Created by 김재동 on 2022/10/04.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
