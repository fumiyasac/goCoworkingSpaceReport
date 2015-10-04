//
//  ListStatus.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/25.
//  Copyright © 2015年 just1factory. All rights reserved.
//

//一覧画面のコンテンツ表示状態のenum
enum ListStatus {
    
    //現在の状態（一覧画面）
    case AlreadyGone
    case NowOpened
    case StayingHere
    
    //状態対応するの値を返す
    func toListControlNumber() -> Int {
        switch (self) {
            case .NowOpened:
                return 0
            case .AlreadyGone:
                return 1
            case .StayingHere:
                return 2
        }
    }
}

