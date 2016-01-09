//
//  GourmetStatus.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/12/14.
//  Copyright © 2015年 just1factory. All rights reserved.
//

enum GourmetStatus {
    
    //テーブルビューの状態（グルメ検索の画面）
    case SelectGnavi
    case SelectHotPepper
    
    //Enumに対応するセクション値を返す
    func returnValue() -> String {
        switch (self) {
        case .SelectGnavi:
            return "gnavi"
        case .SelectHotPepper:
            return "hotpepper"
        }
    }
}
