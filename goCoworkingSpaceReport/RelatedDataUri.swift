//
//  RelatedDataUri.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2016/02/21.
//  Copyright © 2016年 just1factory. All rights reserved.
//

//データ取得元のAPIのアクセスポイント一覧のenum
enum RelatedDataUri: String {

    //テスト環境でのアクセスポイントのURI
    case DetailDataUriTest      = "http://go-coworking-space.dev:8888/api/detail"
    
    case FeaturedDataUriTest    = "http://go-coworking-space.dev:8888/api/featured"
    case GourmetDataUriTest     = "http://go-coworking-space.dev:8888/api/restaurant"
    case HotelDataUriTest       = "http://go-coworking-space.dev:8888/api/hotel"
    case StudyDataUriTest       = "http://go-coworking-space.dev:8888/api/seminar"
    case ConvenienceDataUriTest = "http://go-coworking-space.dev:8888/api/convenience"
    
    //本番環境でのアクセスポイントのURI
    
}
