//
//  NowDetailTableCellDefintion.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/29.
//  Copyright © 2015年 just1factory. All rights reserved.
//

struct NowDetailTableCellDefintion {
    
    /*
        コワーキングスペースの関連情報の文言定義等の格納配列
        ※定義：0 => "画像名", 1:タイトル, 2:一言, 3:概要
    */
    static func cellConstTexts() -> [[String]] {
        return [
            [
                "map_icon",
                "地図情報",
                "迷った時には慌てずにチェックを",
                "始めての場所はやっぱり不安。でも地図があれば怖くはない！"
            ],
            [
                "featured_icon",
                "当メディア特集記事",
                "インタビューやレポートをしてます",
                "コワーキングFun!の特集記事。お仕事や勉強の合間にどうぞ！"
            ],
            [
                "gourmet_icon",
                "グルメ情報",
                "ランチや夕食・懇親会などに",
                "懇親会のお店の候補やランチタイム、打ち上げ等の際には是非！"
            ],
            [
                "study_icon",
                "勉強会情報",
                "最近の勉強会情報の確認に",
                "技術トレンドの発見やイベント情報をいち早く確認してみよう！"
            ],
            [
                "convenience_icon",
                "コンビニ情報",
                "軽食や飲み物・備品の購入に",
                "ふとした買い物の必要が出ても、すぐに探せれば安心ですよね！"
            ],
            [
                "hotel_icon",
                "宿泊施設情報",
                "遠方からのお越しの際に",
                "遠方の大きなイベントや泊まりがけの予定でもお手軽に宿を検索！"
            ],
            [
                "facebook_icon",
                "Facebookページ",
                "お得な情報がゲットできる？",
                "コワーキングスペースの雰囲気や姿も要チェックpoint！"
            ],
            [
                "blog_icon",
                "オーナーBlog / 公式ページ",
                "公式情報やメッセージをお届け",
                "オーナーBlogやコワーキングスペースの公式情報はぜひ確認を！"
            ]
        ]
    }
    
}
