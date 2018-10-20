//
//  ViewController.swift
//  health_tech
//
//  Created by rando on 2018/10/15.
//  Copyright © 2018 askproject. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nextButton1 = UIButton(frame: CGRect(x: 100,y: 100,width: 100,height:50))
        nextButton1.setTitle("button1", for: .normal)
        nextButton1.setTitleColor(UIColor.black, for: .normal)
        nextButton1.tintColor = UIColor.black
        self.view.backgroundColor = UIColor.white
        nextButton1.backgroundColor = UIColor.white
        
        nextButton1.addTarget(self, action: #selector(ViewController.goNext1(_:)), for: .touchUpInside)
        view.addSubview(nextButton1)
        
        let nextButton2 = UIButton(frame: CGRect(x: 100,y: 300,width: 100,height:50))
        nextButton2.setTitle("button2", for: .normal)
        nextButton2.setTitleColor(UIColor.black, for: .normal)
        nextButton2.tintColor = UIColor.black
        self.view.backgroundColor = UIColor.white
        nextButton2.backgroundColor = UIColor.white
        
<<<<<<< HEAD
        nextButton2.addTarget(self, action: #selector(ViewController.goNext2(_:)), for: .touchUpInside)
        view.addSubview(nextButton2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func goNext1(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = Next1ViewController()
//        nextvc.view.backgroundColor = UIColor.yellow
        self.present(nextvc, animated: true, completion: nil)
    }
    
    @objc func goNext2(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = Next2ViewController()
//        nextvc.view.backgroundColor = UIColor.blue
        self.present(nextvc, animated: true, completion: nil)
=======
        // `mainView` オブジェクトを表示します。
        self.view.addSubview(mainView)
        
        //Realmオブジェクト生成
        let realm = try! Realm()
        
        //作成
        let tanaka = User()
        tanaka.sex = "male"
        tanaka.age = 20
        tanaka.height = 180
        tanaka.weight = 70
        tanaka.request = "健康"
        try! realm.write {
            realm.add(tanaka)
        }
        
        //作成
        let yamada = User()
        yamada.sex = "female"
        yamada.age = 18
        yamada.height = 165
        yamada.weight = 80
        yamada.request = "痩せたい"
        try! realm.write {
            realm.add(yamada)
        }
        
        //作成
        let sato = User()
        sato.sex = "male"
        sato.age = 25
        sato.height = 170
        sato.weight = 40
        sato.request = "太りたい"
        try! realm.write {
            realm.add(sato)
        }
        
//        //参照
//        let users = realm.objects(User).filter("id != 0").sorted("id")
//        for user in users {
//            print(user.name)
//        }
//
//        //更新
//        let hoge = realm.objects(User).last!
//        try! realm.write {
//            hoge.name = "ほげ"
//        }
//
//        //参照
//        for user in realm.objects(User).filter("id != 0").sorted("id") {
//            print(user.name)
//        }
//
//        //削除
//        let lastUser = realm.objects(User).last!
//        try! realm.write {
//            realm.delete(lastUser)
//        }
//
//        //参照
//        for user in realm.objects(User).filter("id != 0").sorted("id") {
//            print(user.name)
//        }
        
>>>>>>> rando
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

