//
//  StudyAndEventStatus.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/12/16.
//  Copyright © 2015年 just1factory. All rights reserved.
//

enum StudyAndEventStatus {
    
    //テーブルビューの状態（勉強会検索の画面）
    case SelectConpass
    case SelectDoorkeeper
    
    //Enumに対応するセクション値を返す
    func returnValue() -> Int {
        switch (self) {
        case .SelectConpass:
            return 0
        case .SelectDoorkeeper:
            return 1
        }
    }
}
