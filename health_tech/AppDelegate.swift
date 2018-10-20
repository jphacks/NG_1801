//
//  AppDelegate.swift
//  health_tech
//
//  Created by rando on 2018/10/15.
//  Copyright © 2018 askproject. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // スクリーンの横縦幅
    var screenWidth:CGFloat?
    var screenHeight:CGFloat?
    var statusBarHeight:CGFloat?
    
    //食品のid
    var foodId = 0
    
    //嫌いなものリスト
    var rejectFood = [Int]()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // ここに初期化処理を書く
        // UserDefaultsを使ってフラグを保持する
        let userDefault = UserDefaults.standard
        // "firstLaunch"をキーに、Bool型の値を保持する
        let dict = ["firstLaunch": true]
        // デフォルト値登録
        // ※すでに値が更新されていた場合は、更新後の値のままになる
        userDefault.register(defaults: dict)
        
        // "firstLaunch"に紐づく値がtrueなら(=初回起動)、値をfalseに更新して処理を行う
        if userDefault.bool(forKey: "firstLaunch") {
            userDefault.set(false, forKey: "firstLaunch")
            //            print("初回起動の時だけ呼ばれるよ")
            let id = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77]
            
            let name = ["コールスローサラダ","たまごのマカロニサラダ","ポテトサラダ","鶏そぼろと胡麻の春雨サラダ","ひじきとごぼうの明太サラダ","ツナと玉子のサラダ","ミックス野菜サラダ","わかめと大根のサラダ","わかめサラダ","シーザーサラダ","海老とブロッコリーのタルタルサラダ","豚しゃぶサラダ","ねぎ塩のチキンサラダ","油淋鶏サラダ","幕の内弁当","ハンバーグ弁当","唐揚げ弁当","海苔弁当","牛焼肉弁当","豚焼肉弁当","豚カルビ弁当","牛カルビ弁当","チャーハン弁当","海老天重","鶏めしご飯","焼き鮭ご飯","高菜明太子ご飯","グリルチキンのパスタサラダ","パリパリ麺のサラダ","明太子クリームのパスタサラダ","豚しゃぶのパスタサラダ","サラダラーメン","手巻おにぎり　昆布","手巻海老マヨネーズおにぎり","手巻おにぎり　梅","手巻おにぎり　辛子明太子","手巻きおにぎり　ツナマヨネーズ","手巻きおにぎり　紅鮭","梅こんぶおむすび","赤飯おこわ","青唐味噌おにぎり","納豆巻き","inゼリー エネルギー マスカット味","C1000 ビタミンレモン","オロナミンC","リポビタンD","すごい乳酸菌ドリンク","ドリンクヨーグルト フルーツミックス","1日不足分の食物繊維 のむヨーグルト","1日分のビタミン のむヨーグルト","1日分の鉄分 飲むヨーグルト","ヨーグルトR-1 ドリンクタイプ","毎日の食卓3.6牛乳","特濃調製豆乳","ビタミン野菜","栄養強化型 1日分の野菜","トマトジュース 高リコピントマト使用","こだわりたまご","ふんわりだし巻たまご","味しみ大根","つゆだく白滝","味しみこんにゃく","濃厚絹厚揚げ","さつまあげ","牛すじ串","昆布巻","もち巾着","にくじゃが","筑前煮","濃厚なめらか豆腐","サラダチキン","さばの塩焼き","野菜とソーセージのポトフ","餃子の野菜中華スープ","かぼちゃ煮","モツ煮込み","ミートボール"]
            
            let cal = [77,220,163,122,275,97,37,23,31,133,124,259,149,299,653,706,879,783,577,596,571,775,719,835,473,400,369,404,383,264,279,344,168,197,163,170,220,175,168,204,179,183,180,65,79,74,58,151,121,120,121,76,135,109,79,96,52,80,81,8,5,6,65,47,30,5,132,250,125,107,98,253,173,190,142,171,190]
            
            let gram = [84.7,128.5,110,145.3,140,70.3,106,98,98,110,100,201,162,199,369,383,380,366,357,357,331,356,250,394,270,247,243,205,209,228,199,281,105,110,105,100,110,105,105,105,105,100,180,140,120,100,100,150,180,180,180,112,500,200,200,200,265,75,75,75,75,75,75,75,75,75,75,210,140,100,115,100,255,310,110,160,110]
            
            let protein = [1,7.5,2.3,5.3,2.6,2.4,1.9,1.4,2.9,4.2,4.3,10.7,8.4,13.3,19.2,23.4,27.6,20.9,19.4,17.5,19.1,19.5,13.1,16.9,18.6,15.8,9.5,21.9,7.7,11.9,12.1,14.5,3.2,4.1,2.8,4.8,4.5,4.6,3.8,5.5,30,5.2,0,0,0,0,0.4,4.8,6,6,6,3.6,6.5,8.8,1.3,1.9,2.3,6.6,4.7,0.3,0.1,0.1,4.9,2.8,4.4,0.2,6.3,11.1,7.1,4.7,21.7,15.8,9.2,10,2.8,17.6,8]
            
            let lipid = [5.1,14.3,9.5,6.9,20.8,7.8,0.6,0.4,0.4,10.6,10.1,18.5,9.9,17.1,19.9,26.4,31.9,25.9,11.4,21.7,19.7,30.9,28.9,32.7,5.9,9.9,4.4,14.6,22.4,6.4,7.2,12.2,0.2,3.2,0.4,0.4,6.3,1.1,0.8,0.5,0.4,1.6,0,0,0,0,0,4.9,0.7,0.7,0.7,0.7,7.8,6,0,0,0,5.7,5.9,0,0,0,4.4,0.9,1.1,0,3.4,9.5,2.2,3,0.8,21,9.4,6.9,0.6,9,8.4]
            
            let carbohydrate = [6.8,15.3,17,19,22,6,5.8,3.5,4,5.3,4.1,12.7,6.5,22.7,99.6,93.8,113.7,117.1,99.3,82.9,92.1,90.2,95.4,117.8,85.9,61.8,72.9,46.3,37.7,40.1,41.4,44,38.4,37.9,37.1,36.6,36.4,36.7,36.2,44.4,40.8,36.9,45,0,0,0,15.1,21.9,24.7,22.7,22.8,13.9,9.6,5,19.1,0,12,0.7,2.2,2,2.1,1.9,1.3,7,0.8,1,15.8,30,18.9,5.9,1,0,12.8,22.1,34.1,5.9,20.7]
            
            let sodium = [246,643,480,620,740,260,60,110,220,484,280,643,826,935,1400,1000,1652,1800,972,1200,760,701,94,1300,999,1300,1200,1300,1100,980,776,828,900,900,1500,1200,1000,800,2200,1500,1100,1500,100,0,0,0,100,200,200,200,200,100,200,500,300,800,0.6,249,184,146,178,364,17,236,98,49,92,2900,1100,287,1100,456,2800,3900,700,1700,1800]
            
            let genre = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6]
            
            let url = ["http://sej.dga.jp/i/dispImage.php?id=81867","http://sej.dga.jp/i/dispImage.php?id=81866","http://sej.dga.jp/i/dispImage.php?id=81865","http://sej.dga.jp/i/dispImage.php?id=79374","http://sej.dga.jp/i/dispImage.php?id=81868","http://sej.dga.jp/i/dispImage.php?id=80659","http://sej.dga.jp/i/dispImage.php?id=75664","http://sej.dga.jp/i/dispImage.php?id=81294","http://sej.dga.jp/i/dispImage.php?id=82300","http://sej.dga.jp/i/dispImage.php?id=78555","http://sej.dga.jp/i/dispImage.php?id=81595","http://sej.dga.jp/i/dispImage.php?id=81597","http://sej.dga.jp/i/dispImage.php?id=81596","http://sej.dga.jp/i/dispImage.php?id=75354","http://sej.dga.jp/i/dispImage.php?id=79362","http://sej.dga.jp/i/dispImage.php?id=78298","http://sej.dga.jp/i/dispImage.php?id=81604","http://sej.dga.jp/i/dispImage.php?id=74688","http://sej.dga.jp/i/dispImage.php?id=82282","http://sej.dga.jp/i/dispImage.php?id=81603","http://sej.dga.jp/i/dispImage.php?id=80875","http://sej.dga.jp/i/dispImage.php?id=82063","http://sej.dga.jp/i/dispImage.php?id=81602","http://sej.dga.jp/i/dispImage.php?id=81856","http://sej.dga.jp/i/dispImage.php?id=82064","http://sej.dga.jp/i/dispImage.php?id=82281","http://sej.dga.jp/i/dispImage.php?id=81601","http://sej.dga.jp/i/dispImage.php?id=77445","http://sej.dga.jp/i/dispImage.php?id=82301","http://sej.dga.jp/i/dispImage.php?id=79810","http://sej.dga.jp/i/dispImage.php?id=79375","http://sej.dga.jp/i/dispImage.php?id=79159","https://img.omni7.jp/co/productimage/0005/product/96/041996/image/04004671_08_00_main_m.jpg","https://img.omni7.jp/co/productimage/0005/product/84/043584/image/04024793_00_00_main_m.jpg","https://img.omni7.jp/co/productimage/0005/product/05/042405/image/04023428_00_00_main_m.jpg","https://img.omni7.jp/co/productimage/0005/product/94/041794/image/04004653_01_00_main_m.jpg","https://img.omni7.jp/co/productimage/0005/product/93/045493/image/04016825_04_00_main_m.jpg","https://img.omni7.jp/co/productimage/0005/product/42/040642/image/04004759_07_00_main_m.jpg","https://img.omni7.jp/co/productimage/0005/product/30/040430/image/04023265_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/16/040516/image/04004674_03_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/51/042851/image/04024767_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/29/046129/image/04021689_00_00_main_l.jpgh","https://img.omni7.jp/co/productimage/0005/product/26/470026/image/47000352_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/06/470006/image/47000157_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/18/470018/image/S0001654_00_00_main_l.jpghttps://7-11net.omni7.jp/detail/470018","https://img.omni7.jp/co/productimage/0005/product/52/470152/image/47000225_01_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/96/470096/image/47000586_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/23/210123/image/21002235_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/90/210290/image/21002224_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/81/210281/image/21002222_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/82/210282/image/21002223_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/95/210395/image/21000317_11_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/76/210176/image/21001523_02_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/91/210491/image/21001449_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/08/210608/image/21001651_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/11/210611/image/21001652_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/46/461146/image/46001580_01_00_main_l.jpg","http://sej.dga.jp/i/dispImage.php?id=79856","http://sej.dga.jp/i/dispImage.php?id=79872","http://sej.dga.jp/i/dispImage.php?id=79853","http://sej.dga.jp/i/dispImage.php?id=79880","http://sej.dga.jp/i/dispImage.php?id=79854","http://sej.dga.jp/i/dispImage.php?id=44332","http://sej.dga.jp/i/dispImage.php?id=79877","http://sej.dga.jp/i/dispImage.php?id=79840","http://sej.dga.jp/i/dispImage.php?id=79866","http://sej.dga.jp/i/dispImage.php?id=16494","https://iroiroblend.com/wp-content/uploads/2017/10/ba955acd76c977510284d1a57fceccaf.png","https://iroiroblend.com/wp-content/uploads/2017/10/b4c41a23e910e0fe9e02cc245127c287.png","https://iroiroblend.com/wp-content/uploads/2017/10/dc2eeced70683d6d3c5ca2f2ebad9443.png","https://iroiroblend.com/wp-content/uploads/2017/10/97008ebf7a6315dfad04a52162a5c554.png","https://iroiroblend.com/wp-content/uploads/2017/10/7897ba9fa47fe802a959f397ba7e67fc.png","https://iroiroblend.com/wp-content/uploads/2017/10/05fca9ee369142e290acdf03aeb58ce7.png","https://iroiroblend.com/wp-content/uploads/2017/10/212159d68f1a8558beac0979efb07ce4.png","https://img.omni7.jp/co/productimage/0005/product/73/103273/image/10020844_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/35/103335/image/10020788_00_00_main_l.jpg","https://img.omni7.jp/co/productimage/0005/product/29/104029/image/10015807_00_00_main_l.jpg"]
            
            //Realmオブジェクト生成
            let realm = try! Realm()
            
            for i in 0..<id.count {
                let food = Food()
                food.id = id[i]
                food.name = name[i]
                food.cal = cal[i]
                food.gram = gram[i]
                food.protein = protein[i]
                food.lipid = lipid[i]
                food.carbohydrate = carbohydrate[i]
                food.sodium = sodium[i]
                food.genre = genre[i]
                food.url = url[i]
                try! realm.write {
                    realm.add(food)
                }
            }
            print("データベース更新")
        }
    
        calculation()

//        if (users.count > 0){
//            print("ユーザーデータが存在します")
//            user = users.first!
//            user_flag = true
//            if(user.sex){
//                segment.selectedSegmentIndex = 0
//            }else{
//                segment.selectedSegmentIndex = 1
//            }
//            HeightTextfield.text = String(user.height)
//            WeightTextfield.text = String(user.weight)
//            AgeTextfield.text = String(user.age)
//            picker.selectRow(user.request, inComponent: 0, animated: true)
//
//        }else{
//            print("ユーザーデータが存在しません")
//            user_flag = false
//        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SplashViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    //    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    //        // Override point for customization after application launch.
    //
    //        // アプリウィンドウを設定します。
    //        self.window = UIWindow(frame: UIScreen.main.bounds)
    //
    //        // ウィンドウをヴィジブルにします。
    //        self.window?.makeKeyAndVisible()
    //
    //        // ウィンドウの rootViewController を viewController に設定します。
    //        self.window?.rootViewController = viewController
    //
    //        return true
    //    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func calculation(){
        //ユーザー情報取得
        let realm = try! Realm()
        let users = realm.objects(User.self)
        //        print(users)
        let bmi_score = users[0].weight / (users[0].height * 0.01 * users[0].height * 0.01)
        var bmi = 0
        switch bmi_score{
        case (0...18.5): //低体重
            bmi = 1
        case (18.5...25): //普通体重
            bmi = 2
        case (25...30): //肥満度1
            bmi = 3
        case (30...35): //肥満度2
            bmi = 4
        case (35...40): //肥満度3
            bmi = 5
        default: //肥満度4
            bmi = 6
        }
        print("BMIスコア")
        print(bmi_score)
        print("BMI")
        print(bmi)
        
        var required_cal:Double = 0
        if(users[0].sex){
            switch users[0].age{
            case (0...2): //年齢
                required_cal = 700 * 1.35 //male
            case (3...5):
                required_cal = 900 * 1.45
            case (6...7):
                required_cal = 980 * 1.55
            case (8...9):
                required_cal = 1140 * 1.60
            case (10...11):
                required_cal = 1330 * 1.65
            case (12...14):
                required_cal = 1520 * 1.65
            case (15...17):
                required_cal = 1610 * 1.75
            case (18...29):
                required_cal = 1520 * 1.75
            case (30...49):
                required_cal = 1530 * 1.75
            case (50...69):
                required_cal = 1400 * 1.75
            default:
                required_cal = 1290 * 1.70
            }
        }else{
            switch users[0].age{
            case (0...2): //年齢
                required_cal = 660 * 1.35 //female
            case (3...5):
                required_cal = 840 * 1.45
            case (6...7):
                required_cal = 920 * 1.55
            case (8...9):
                required_cal = 1050 * 1.60
            case (10...11):
                required_cal = 1260 * 1.65
            case (12...14):
                required_cal = 1410 * 1.65
            case (15...17):
                required_cal = 1310 * 1.75
            case (18...29):
                required_cal = 1110 * 1.75
            case (30...49):
                required_cal = 1150 * 1.75
            case (50...69):
                required_cal = 1110 * 1.75
            default:
                required_cal = 1020 * 1.70
            }
        }
        if(users[0].request == 1){
            required_cal = required_cal * 0.8
        }
        print("必要カロリー")
        print(required_cal)
        
        var required_protein:Double = 0
        if(users[0].sex){
            switch users[0].age{
            case (0...2): //年齢
                required_protein = 20
            case (3...5):
                required_protein = 25
            case (6...7):
                required_protein = 35 //male
            case (8...9):
                required_protein = 40
            case (10...11):
                required_protein = 50
            case (12...14):
                required_protein = 60
            case (15...17):
                required_protein = 65
            default:
                required_protein = 60
            }
        }else{
            switch users[0].age{
            case (0...2): //年齢
                required_protein = 20
            case (3...5):
                required_protein = 25
            case (6...7):
                required_protein = 30 //female
            case (8...9):
                required_protein = 40
            case (10...11):
                required_protein = 50
            case (12...14):
                required_protein = 55
            case (15...17):
                required_protein = 55
            default:
                required_protein = 50
            }
        }
        if(users[0].request == 2){
            required_protein = required_protein * 1.5
        }
        print("必要タンパク質")
        print(required_protein)
        
        let required_lipid = 25
        print("必要脂質")
        print(required_lipid)
        
        let required_carbo = 60
        print("必要炭水化物")
        print(required_carbo)
        
        var required_sodium:Double = 0
        if(users[0].sex){
            switch users[0].age{
            case (0...2): //年齢
                required_sodium = 3.0 //male
            case (3...5):
                required_sodium = 4.0
            case (6...7):
                required_sodium = 5.0
            case (8...9):
                required_sodium = 5.5
            case (10...11):
                required_sodium = 6.5
            default:
                required_sodium = 8.0
            }
        }else{
            switch users[0].age{
            case (0...2): //年齢
                required_sodium = 3.5 //female
            case (3...5):
                required_sodium = 4.5
            case (6...7):
                required_sodium = 5.5
            case (8...9):
                required_sodium = 6.0
            case (10...11):
                required_sodium = 7.0
            default:
                required_sodium = 7.0
            }
        }
        print("ナトリウム")
        print(required_sodium)
    }
    
    
}
