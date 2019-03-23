//
//  MessegesViewController.swift
//  Find a Doctor
//
//  Created by CalibrageMac02 on 22/03/19.
//  Copyright © 2019 Calibrage Info System Pvt Limitd. All rights reserved.
//

import UIKit

class MessegesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var messehesTableview: UITableView!
    
    var messagesArray = Array<String>()
    var subTitlesArray = Array<String>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         self.navigationItem.title = "Profile"
        
        messehesTableview.delegate = self
        messehesTableview.dataSource = self
        
        messagesArray = ["Messege1","Messege2","Messege3","Messege4","Messege5"]
        subTitlesArray = ["Refocus and recharge with these inspirational sayings.","Without the ups and downs, life just wouldn't be the same","Find the push you need to get where you're going with these famous words of wisdom.","Caroline is the Health Editor at GoodHousekeeping.com covering nutrition, fitness, wellness, and other lifestyle news.","If you are down now or just wanting to read some life advice"]
      
        
        let nibName3  = UINib(nibName: "MessegeTableViewCell" , bundle: nil)
        messehesTableview.register(nibName3, forCellReuseIdentifier: "MessegeTableViewCell")
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messagesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = messehesTableview.dequeueReusableCell(withIdentifier: "MessegeTableViewCell", for: indexPath) as!  MessegeTableViewCell
        
        cell.titleLbl.text = messagesArray[indexPath.row]
        cell.subTitileLbl.text = subTitlesArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    

}
