//
//  Service.swift
//  HeroListView
//
//  Created by developer team on 17/10/2562 BE.
//  Copyright © 2562 developer team. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    private var alamoreFiewManager: Alamofire.SessionManager
    private var URL:String=""
    private var paramenters:[String:Any]?
    private var header : [String:String]?
    
    var setURL:String = " "{
        didSet{
            URL = setURL
        }
    }
    var setParam:[String:Any]!{
        didSet{
            paramenters = setParam
        }
    }
    var setHeader :[String:String]!{
        didSet{
            header = setHeader
        }
    }
    init(){
        alamoreFiewManager = Alamofire.SessionManager.default
        alamoreFiewManager.session.configuration.timeoutIntervalForRequest = 30
        alamoreFiewManager.session.configuration.timeoutIntervalForRequest = 30
    }
    
    func loadAPI(
        metthod:HTTPMethod,
        sucsess:((_ data:Any?)->())?,
        error:((_ error:Error?)->())?){
        
        
        alamoreFiewManager.request(
        URL,
        method: metthod,
        parameters: paramenters,
        encoding: URLEncoding.default,
        headers: header).responseData { (res) in
            if res.result.isSuccess{
                sucsess?(res.result.value)
            }else{
                error?(res.result.error)
            }
        }
    }
}
