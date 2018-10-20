//
//  User.swift
//  health_tech
//
//  Created by rando on 2018/10/20.
//  Copyright © 2018 askproject. All rights reserved.
//

import RealmSwift

class User: Object {
    @objc dynamic var sex:Bool = true
    @objc dynamic var age = 0
    @objc dynamic var height: Double = 0
    @objc dynamic var weight: Double = 0
    @objc dynamic var request = 0
}
