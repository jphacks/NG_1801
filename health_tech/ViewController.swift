//
//  ViewController.swift
//  health_tech
//
//  Created by rando on 2018/10/15.
//  Copyright © 2018 askproject. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 画面サイズを初期値として `MainView` クラスを `mainView` としてインスタンス化します。
        let mainView = MainView(frame: self.view.bounds)
        
        // `MainView` に自動サイズ調整用に `autoresizingMask` を設定
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // `mainView` オブジェクトを表示します。
        self.view.addSubview(mainView)
    }
    
    

}

