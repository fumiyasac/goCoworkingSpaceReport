//
//  DetailRelateTableDefinition.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/21.
//  Copyright © 2015年 just1factory. All rights reserved.
//

//コワーキングスペース関連情報のenum
//※詳細情報を別のControllerに切り出した（重すぎたのでModalで関連情報を表示＆検索できるページを作成）
enum DetailRelateTableDefinition {
    
    //テーブルビューの状態（コワーキングスペースの詳細画面）
    case FacebookInformation
    case EventAndStudyInformation
    
    //Enumに対応するセクション値を返す
    func returnValue() -> Int {
        switch (self) {
        case .FacebookInformation:
            return 0
        case .EventAndStudyInformation:
            return 1
        }
    }
    
    //Enumに対応するセル数の値を返す
    func sectionInitialAmount() -> Int {
        switch (self) {
        case .FacebookInformation:
            return 10
        case .EventAndStudyInformation:
            return 10
        }
    }
    
    //Enumに対応するセル高の値を返す
    func sectionHeight() -> Double {
        switch (self) {
        case .FacebookInformation:
            return 100.0
        case .EventAndStudyInformation:
            return 100.0
        }
    }
    
    //Enumに対応するヘッダー高さの値を返す
    func sectionHeaderHeight() -> Double {
        switch (self) {
        case .FacebookInformation:
            return 20.0
        case .EventAndStudyInformation:
            return 20.0
        }
    }
}
