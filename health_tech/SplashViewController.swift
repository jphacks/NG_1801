//
//  ViewController.swift
//  health_tech
//
//  Created by rando on 2018/10/15.
//  Copyright © 2018 askproject. All rights reserved.
//

import UIKit
import RealmSwift

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // background image
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "background.png")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
        
        // splash image
        let sp = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/2, height:self.view.frame.size.width/2*72/102))
        sp.image = UIImage(named: "splash.png")
        sp.center = self.view.center
        sp.layer.zPosition = 0
        self.view.addSubview(sp)
        
        //AppDelegateのインスタンスを取得
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        // スクリーンの横縦幅
        appDelegate.screenWidth = self.view.frame.width
        appDelegate.screenHeight = self.view.frame.height
        // ステータスバーの高さを取得
        appDelegate.statusBarHeight = UIApplication.shared.statusBarFrame.height
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //遅延処理
        let dispatchTime = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter( deadline: dispatchTime ) {
            //ユーザー情報の確認
            let realm = try! Realm()
            let users = realm.objects(User.self)
            if (users.count > 0){
                print("スプラッシュ画面:ユーザー情報が存在します。メイン画面に遷移します。")
                self.present(MainViewController(), animated: false, completion: nil)
            }else{
                print("スプラッシュ画面:ユーザー情報が存在しません。設定画面に遷移します。")
                self.present(SettingViewController(), animated: false, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

