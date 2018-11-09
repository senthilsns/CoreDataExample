//
//  UserDetailViewController.swift
//  CoreDataExample
//
//  Created by SENTHIL on 09/11/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    
    //MARK:UITableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10 //arrayOfList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UserDetailCell? = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell") as? UserDetailCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "UserDetailCell") as? UserDetailCell
        }
        
        cell?.userNameLabel.text = "Senthil"
        cell?.positionLabel.text = "SSE"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80.0
    }


}
