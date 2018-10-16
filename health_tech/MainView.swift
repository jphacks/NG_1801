//
//  MainView.swift
//  health_tech
//
//  Created by rando on 2018/10/16.
//  Copyright © 2018 askproject. All rights reserved.
//

import UIKit

class MainView: UIView {
    let mainLabel: UILabel
    
    override init(frame: CGRect) {
        
        // `mainLabel` を作ります。
        self.mainLabel = UILabel()
        
        // `mainLabel` の表示テキストを設定します。
        self.mainLabel.text = "Hello World!"
        
        // `mainLabel` の表示テキストのセンタリングを設定します。
        self.mainLabel.textAlignment = .center
        
        // `mainLabel` の設定が全て終わりましたので、親クラスを初期化します。
        super.init(frame: frame)
        
        // `MainView` クラスの背景色を白に設定します。
        self.backgroundColor = .white
        
        // `MainView` に `mainLabel` を表示します。
        self.addSubview(mainLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        // 必ず `super` の `layoutSubviews()` を呼び出します
        super.layoutSubviews()
        
        // `mainLabel` がほしいサイズを自分のサイズから `sizeThatFits(_:)` を通して取り出します
        let labelSize = self.mainLabel.sizeThatFits(self.bounds.size)
        
        // `mainLabel` を真ん中に置くように、原点座標を先ほど取得したサイズと自分のサイズから割り出します
        let x = (self.bounds.width - labelSize.width) / 2
        let y = (self.bounds.height - labelSize.height) / 2
        let labelOrigin = CGPoint(x: x, y: y)
        
        // `mainLabel` のレイアウトは、`frame` に原点座標とサイズで代入して決めます
        self.mainLabel.frame = CGRect(origin: labelOrigin, size: labelSize)
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
