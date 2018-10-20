//
//  MainView.swift
//  health_tech
//
//  Created by rando on 2018/10/16.
//  Copyright © 2018 askproject. All rights reserved.
//

import UIKit
//import RealmSwift

class MainView: UIView {
    let mainLabel: UILabel
    let button1: UIButton
    let button2: UIButton
    
    override init(frame: CGRect) {
        // `mainLabel` を作ります。
        self.mainLabel = UILabel()
        // `mainLabel` の表示テキストを設定します。
<<<<<<< HEAD
        self.mainLabel.text = "Hello World!"
=======
        self.mainLabel.text = "Hello World"
        
>>>>>>> rando
        // `mainLabel` の表示テキストのセンタリングを設定します。
        self.mainLabel.textAlignment = .center
        
        self.button1 = UIButton(type: .system)
        self.button1.setTitle("button1", for: .normal)
        self.button1.tintColor = UIColor.black
        self.button1.titleLabel?.font = UIFont.systemFont(ofSize: 18)

        
        self.button2 = UIButton(type: .system)
        self.button2.setTitle("button2", for: .normal)
        self.button2.tintColor = UIColor.black
        self.button2.titleLabel?.font = UIFont.systemFont(ofSize: 18)


        
        // `mainLabel` の設定が全て終わりましたので、親クラスを初期化します。
        super.init(frame: frame)
        
        // `MainView` クラスの背景色を白に設定します。
        self.backgroundColor = .white
       
//        self.button1.addTarget(self, action: #selector(onTappedPush1(_:)), for: .touchUpInside)
//        self.button2.addTarget(self, action: #selector(onTappedPush2(_:)), for: .touchUpInside)
        
        // `MainView` に `mainLabel` を表示します。
        self.addSubview(mainLabel)
        self.addSubview(button1)
        self.addSubview(button2)
        

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        // 必ず `super` の `layoutSubviews()` を呼び出します
        super.layoutSubviews()
        
        // `mainLabel` がほしいサイズを自分のサイズから `sizeThatFits(_:)` を通して取り出します
        let labelSize = self.mainLabel.sizeThatFits(self.bounds.size)
        let button1Size = self.button1.sizeThatFits(self.bounds.size)
        let button2Size = self.button2.sizeThatFits(self.bounds.size)
        // `mainLabel` を真ん中に置くように、原点座標を先ほど取得したサイズと自分のサイズから割り出します
        let x = (self.bounds.width - labelSize.width) / 2
        let y = (self.bounds.height - labelSize.height) / 4
        let labelOrigin = CGPoint(x: x, y: y)
        let x1 = (self.bounds.width - button1Size.width) / 2
        let y1 = (self.bounds.height - button1Size.height) / 2
        let button1Origin = CGPoint(x: x1, y: y1)
        let x2 = (self.bounds.width - button2Size.width) / 2
        let y2 = (self.bounds.height - button2Size.height) / 4 * 3
        let button2Origin = CGPoint(x: x2, y: y2)
        // `mainLabel` のレイアウトは、`frame` に原点座標とサイズで代入して決めます
        self.mainLabel.frame = CGRect(origin: labelOrigin, size: labelSize)
        self.button1.frame = CGRect(origin: button1Origin, size: button1Size)
        self.button2.frame = CGRect(origin: button2Origin, size: button2Size)
        
    }
    
//    @objc func onTappedPush1(_ sender: UIButton) {
//        print(sender)
//        let vc = NextViewController()
//        self.presen
//    }
//
//    @objc func onTappedPush2(_ sender: UIButton) {
//        print(sender)
//        let vc2 = SecondViewController()
//    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
