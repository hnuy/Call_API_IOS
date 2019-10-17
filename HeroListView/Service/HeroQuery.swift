//
//  HeroQuery.swift
//  HeroListView
//
//  Created by developer team on 17/10/2562 BE.
//  Copyright © 2562 developer team. All rights reserved.
//

import Foundation

protocol HeroQueryDekegate:NSObjectProtocol {
    func didLoadHeroSucess(hero:[Hero])
    func didLoadHeroFailed(error:Error?)
}

extension HeroQueryDekegate{
    
    func didLoadHeroFailed(error:Error)  {
        
    }
}

class HeroQuery {
    weak var delegate:HeroQueryDekegate?
    
    private let service:Service!
    init() {
        service = Service()
    }
    
    func getAllHero (){
        service.setURL = "https://peerapongsam.github.io/heropedia/json/english/heroes.json"
        service.loadAPI(metthod: .get, sucsess: {(data) in
            guard let data = data as? Data else {return}
            //binding
            
            do {
                let heros = try JSONDecoder().decode([Hero].self, from: data)
                self.delegate?.didLoadHeroSucess(hero: heros)
            } catch {
                print(error)
            }
            
//            if let heros = try? JSONDecoder().decode([Hero].self, from: data){
//                self.delegate?.didLoadHeroSucess(hero: heros)
//            }else{
//                fatalError("can't binding data to Model")
//            }
        }){(error) in
            self.delegate?.didLoadHeroFailed(error:error)
            
            
        }
    }
}
