//
//  Food.swift
//  health_tech
//
//  Created by rando on 2018/10/20.
//  Copyright © 2018 askproject. All rights reserved.
//

import RealmSwift

class Food: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var kcal = 0
    @objc dynamic var gram: Double = 0
    @objc dynamic var protein: Double = 0
    @objc dynamic var Lipid: Double = 0
    @objc dynamic var carbohydrate: Double = 0
    @objc dynamic var Genre = ""
}
