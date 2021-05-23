//
//  BountyInfo.swift
//  BountyList
//
//  Created by ho jun lim on 2021/05/23.
//

import UIKit

struct BountyInfo {
    let name:String
    let bounty:Int
    var image:UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    init(name:String,bounty:Int) {
        self.name = name
        self.bounty = bounty
    }
}

