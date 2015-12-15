//
//  ColorStatus.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/10/01.
//  Copyright © 2015年 just1factory. All rights reserved.
//

//このアプリで使用するカラースキームのenum
enum ColorStatus: String {
    
    //実際に使用するカラースキーム
    case Red       = "cc0000"
    case Green     = "339933"
    case Orange    = "ff9900"
    case Yellow    = "ffcc33"
    case Gray      = "666666"
    case LightGray = "cccccc"
    case Brown     = "cc9933"
    case White     = "ffffff"
    case Black     = "000000"
    
    //その他カラースキーム(Gourmet)
    case GnaviColor     = "ff3300"
    case HotPepperColor = "ff9933"

    //その他カラースキーム(Study)
    case ConpassColor    = "d52e02"
    case DoorkeeperColor = "73a2b3"
    
    //テスト用カラースキーム
    case Test1 = "99ccff"
    case Test2 = "ff6699"
    case Test3 = "66ff66"
}
