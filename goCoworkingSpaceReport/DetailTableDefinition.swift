//
//  DetailTableDefinition.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/08.
//  Copyright © 2015年 just1factory. All rights reserved.
//

//コワーキングスペース詳細情報のenum
//※セル構成が複雑すぎる感があるのであらかじめ一箇所にまとめる（うまくいけば他Controllerでも実施）
enum DetailTableDefinition {
    
    //テーブルビューの状態（コワーキングスペースの詳細画面）
    case CoworkingSpaceIntroductionImage
    case CoworkingSpaceIntroductionText
    case EverybodyPhotographHeaderOnly
    case DetailButtonCell
    case FacebookInformation
    case EventAndStudyInformation
    case SocialButtonHeaderOnly
    
    //Enumに対応するセクション値を返す
    func returnValue() -> Int {
        switch (self) {
            case .CoworkingSpaceIntroductionImage:
                return 0
            case .CoworkingSpaceIntroductionText:
                return 1
            case .EverybodyPhotographHeaderOnly:
                return 2
            case .DetailButtonCell:
                return 3
            case .FacebookInformation:
                return 4
            case .EventAndStudyInformation:
                return 5
            case .SocialButtonHeaderOnly:
                return 6
        }
    }
    
    //Enumに対応するセル数の値を返す
    func sectionAmount() -> Int {
        switch (self) {
            case .CoworkingSpaceIntroductionImage:
                return 1
            case .CoworkingSpaceIntroductionText:
                return 1
            case .EverybodyPhotographHeaderOnly:
                return 0
            case .DetailButtonCell:
                return 4
            case .FacebookInformation:
                return 6
            case .EventAndStudyInformation:
                return 6
            case .SocialButtonHeaderOnly:
                return 0
        }
    }
    
    //Enumに対応するセル高の値を返す
    func sectionHeight() -> Double {
        switch (self) {
            case .CoworkingSpaceIntroductionImage:
                return 180.0
            case .CoworkingSpaceIntroductionText:
                return 80.0
            case .EverybodyPhotographHeaderOnly:
                return 0.0
            case .DetailButtonCell:
                return 70.0
            case .FacebookInformation:
                return 100.0
            case .EventAndStudyInformation:
                return 100.0
            case .SocialButtonHeaderOnly:
                return 0.0
        }
    }
    
    //Enumに対応するヘッダー高さの値を返す
    func sectionHeaderHeight() -> Double {
        switch (self) {
            case .EverybodyPhotographHeaderOnly:
                return 140.0
            case .SocialButtonHeaderOnly:
                return 100.0
            default:
                return 0.0
        }
    }
}
