//
//  HeroModel.swift
//  HeroListView
//
//  Created by developer team on 17/10/2562 BE.
//  Copyright © 2562 developer team. All rights reserved.
//

import Foundation

struct Hero  :Codable{
    var id : String
    var name :String
    var portrait : Portrait
    var attack : String
    var roles : [String]
    var primaryAttribs : String
    
    enum CodingKeys:String,CodingKey {
        case id,name,portrait,attack,roles
        case primaryAttribs = "primary_attribs"
        
    }
    
    struct Portrait :Codable{
        var full : String
        var vert : String
        
    }
    
}
