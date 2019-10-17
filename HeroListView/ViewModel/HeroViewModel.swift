//
//  HeroViewModel.swift
//  HeroListView
//
//  Created by developer team on 17/10/2562 BE.
//  Copyright © 2562 developer team. All rights reserved.
//

import Foundation
import UIKit

extension HeroViewModel {
    enum HeroType:String{
        case melee = "Melee"
        case range = "Ranged"
    }
}

struct HeroViewModel{
    let id : String
    let name : String
    let image :String
    let type:HeroViewModel.HeroType
    
    init(hero:Hero){
        self.id = hero.id
        self.name = hero.name
        self.image = hero.portrait.full
        self.type = HeroType(rawValue: hero.attack) ?? .melee
    }
}
