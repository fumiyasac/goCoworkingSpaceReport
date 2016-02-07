//
//  MapPopupUnitController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/28.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

//MapKitをインポート
import MapKit

//CoreLocationをインポート
import CoreLocation

class MapPopupUnitController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    //遷移元から送られてきたDictionary
    var mapDataList: [String : String]!
    
    //詳細ページからもらう値を入れる変数
    var coworkingSpaceId : Int! = 0
    var coworkingSpaceTitle : String! = ""
    var coworkingSpaceImage: String! = ""
    var coworkingSpaceRoute: String! = ""
    
    //配置したインスタンス群
    @IBOutlet var mapBackGround: UIView!
    @IBOutlet var mapCloseBtn: UIButton!
    @IBOutlet var mapTitleLbl: UILabel!
    @IBOutlet var mapDisplayArea: MKMapView!
    @IBOutlet var mapImg: UIImageView!
    
    @IBOutlet var mapRouteLbl: UILabel!
    @IBOutlet var mapRoute: UITextView!
    
    override func viewWillAppear(animated: Bool) {
        
        //再配置用の計算値
        let mapRouteViewPosY: Int = DeviceSize.screenHeight() - 160
        let routeTitlePosY: Int = DeviceSize.screenHeight() - 182
        let mapRouteWidth: Int = DeviceSize.screenHeight() - 290
        let mapThumbPosY: Int = DeviceSize.screenHeight() - 260
        
        self.mapImg.frame = CGRectMake(
            CGFloat(20),
            CGFloat(mapThumbPosY),
            CGFloat(60),
            CGFloat(60)
        )
        
        self.mapDisplayArea.frame = CGRectMake(
            CGFloat(10),
            CGFloat(100),
            CGFloat(DeviceSize.screenWidth()-20),
            CGFloat(mapRouteWidth)
        )
        
        self.mapRouteLbl.frame = CGRectMake(
            CGFloat(10),
            CGFloat(routeTitlePosY),
            CGFloat(100),
            CGFloat(15)
        )
        
        self.mapRoute.frame = CGRectMake(
            CGFloat(10),
            CGFloat(mapRouteViewPosY),
            CGFloat(DeviceSize.screenWidth()-20),
            CGFloat(150)
        )
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //----- サンプル用テストデータ #Start ------
        //ローカルプッシュ表示の許可をもらう
        /*
        let setting = UIUserNotificationSettings(forTypes: [.Sound, .Alert], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(setting)
        
        //Notificationの生成する
        let myNotification: UILocalNotification = UILocalNotification()
        
        //メッセージを代入する
        myNotification.alertBody = "TEST(Fire)"
        
        //再生サウンドを設定する
        myNotification.soundName = UILocalNotificationDefaultSoundName
        
        //Timezoneを設定する
        myNotification.timeZone = NSTimeZone.defaultTimeZone()
        
        //10秒後に設定する
        myNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        
        //Notificationを表示する
        UIApplication.sharedApplication().scheduleLocalNotification(myNotification)
        */

        /* ----- 取得データに関するのテストコード ----- */
        print(self.coworkingSpaceId)
        print(self.coworkingSpaceTitle)
        self.mapTitleLbl.text = self.coworkingSpaceTitle
        
        print(self.coworkingSpaceImage)
        let mapImgThumb = UIImage(named: self.coworkingSpaceImage)
        self.mapImg.image = mapImgThumb
        
        print(self.coworkingSpaceRoute)
        self.mapRoute.text = self.coworkingSpaceRoute
        
        //緯度・経度を設定
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(35.678697, 139.782127)
        self.mapDisplayArea.setCenterCoordinate(location, animated: true)
        
        //縮尺を設定
        var region:MKCoordinateRegion = mapDisplayArea.region
        region.center = location
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        
        //ピンを設定
        let pin = MKPointAnnotation()
        pin.coordinate = location
        pin.title = "タイトル"
        pin.subtitle = "サブタイトル"

        //マップに関する設定をする
        self.mapDisplayArea.addAnnotation(pin)
        self.mapDisplayArea.setRegion(region, animated: true)
        
        //地図表示
        self.mapDisplayArea.mapType = MKMapType.Standard
        //----- サンプル用テストデータ #End ------
        
        //@todo: データ実装
        
    }
    
    @IBAction func closeMapViewAction(sender: UIButton) {
        
        //押されたらポップアップ状態から消す
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
