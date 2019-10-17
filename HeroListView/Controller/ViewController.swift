//
//  ViewController.swift
//  HeroListView
//
//  Created by developer team on 17/10/2562 BE.
//  Copyright © 2562 developer team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tabale:UITableView!

    private var HeroList:[HeroViewModel] = []
    private var HeroAPI:HeroQuery?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabale.delegate = self
        tabale.dataSource = self
        
        HeroAPI = HeroQuery()
        HeroAPI?.delegate = self
        HeroAPI?.getAllHero()
        
    }

    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HeroList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroCell",for: indexPath) as! HeroCell
        cell.heroViewModel = HeroList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
}

extension ViewController:HeroQueryDekegate{
    func didLoadHeroFailed(error: Error?) {
        print("error\(error)")
    }
    
    func didLoadHeroSucess(hero: [Hero]) {
//        print("did load hero\(hero.count)")
        HeroList = hero.map({ HeroViewModel(hero: $0)})
        tabale.reloadData()
    }
}
