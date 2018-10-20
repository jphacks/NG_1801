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
        
        let realm = try! Realm()
        let foods = realm.objects(Food.self).filter("cal < 50")
        for i in 0..<foods.count {
            let food:Food = foods[i]
            print(food.name)
        }
        
        //AppDelegateのインスタンスを取得
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        // スクリーンの横縦幅
        appDelegate.screenWidth = self.view.frame.width
        appDelegate.screenHeight = self.view.frame.height
        // ステータスバーの高さを取得
        appDelegate.statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let nextButton1 = UIButton(frame: CGRect(x: 100,y: 100,width: 100,height:50))
        nextButton1.setTitle("button1", for: .normal)
        nextButton1.setTitleColor(UIColor.black, for: .normal)
        nextButton1.tintColor = UIColor.black
        self.view.backgroundColor = UIColor.white
        nextButton1.backgroundColor = UIColor.white
        
        nextButton1.addTarget(self, action: #selector(SplashViewController.goNext1(_:)), for: .touchUpInside)
        view.addSubview(nextButton1)
        
        let nextButton2 = UIButton(frame: CGRect(x: 100,y: 300,width: 100,height:50))
        nextButton2.setTitle("button2", for: .normal)
        nextButton2.setTitleColor(UIColor.black, for: .normal)
        nextButton2.tintColor = UIColor.black
        self.view.backgroundColor = UIColor.white
        nextButton2.backgroundColor = UIColor.white
        
        nextButton2.addTarget(self, action: #selector(SplashViewController.goNext2(_:)), for: .touchUpInside)
        view.addSubview(nextButton2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func goNext1(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = SettingViewController()
        //        nextvc.view.backgroundColor = UIColor.yellow
        self.present(nextvc, animated: true, completion: nil)
    }
    
    @objc func goNext2(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = MainViewController()
        //        nextvc.view.backgroundColor = UIColor.blue
        self.present(nextvc, animated: true, completion: nil)
    }
    
    // Do any additional setup after loading the view, typically from a nib.
    
    // 画面サイズを初期値として `MainView` クラスを `mainView` としてインスタンス化します。
    ////        let mainView = Nav1ViewController()
    //        let mainView = MainView(frame: self.view.bounds)
    //
    //
    //        // `MainView` に自動サイズ調整用に `autoresizingMask` を設定
    //        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    //
    //        // `mainView` オブジェクトを表示します。
    //        self.view.addSubview(mainView)
    //
    //        let vc = Nav1ViewController()
    //        let vc2 = Nav2ViewController()
    //    }
    
    
    
}

