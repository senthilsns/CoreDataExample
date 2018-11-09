//
//  UserDetailViewController.swift
//  CoreDataExample
//
//  Created by SENTHIL on 09/11/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit
import CoreData

class UserDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    var personDetails = [NSManagedObject]()
    @IBOutlet var tableView: UITableView!
    
    //MARK: Back Button Action
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fetchDetails()
        
    }
    
    //MARK: CoreData -> Fetch
    func fetchDetails() {
        
        // Core Data ---> Fetch
        
        // Step1:  Container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // Step 2: We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Step 3: Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDetail")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            // Assign Result to PersonDetails
            personDetails =  result as! [NSManagedObject]
            
            // Reload Table View
            tableView.reloadData()
            
        } catch {
            print("Failed")
        }

    }
    
    
    //MARK: CoreData -> Delete
    func deletePersonDetails(indexPath:IndexPath){

        // Step 1: Container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
         // Step 2: We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Step 3: Remove the deleted item from the model
        managedContext.delete(personDetails[indexPath.row]as NSManagedObject)
        personDetails.remove(at: indexPath.row)
        
        // Step 4: Remove Data from Table View with Animation
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        do{
            try managedContext.save()
        } catch {
            print(error)
        }
    }
}


extension UserDetailViewController {
    
    //MARK:UITableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return personDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UserDetailCell? = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell") as? UserDetailCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "UserDetailCell") as? UserDetailCell
        }
        
        // Take Value from PersonDetails (NSManagedObject Array)
        let person = personDetails[indexPath.row]
        cell?.userNameLabel.text = person.value(forKey: "username") as? String
        cell?.positionLabel.text = person.value(forKey: "position") as? String
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80.0
    }
    
    
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
        
        deletePersonDetails(indexPath: indexPath)
    
//        // remove the deleted item from the model
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        managedContext.delete(personDetails[indexPath.row]as NSManagedObject)
//
//        personDetails.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .fade)
//
//        do{
//            try managedContext.save()
//        } catch {
//            print(error)
//        }
      }
    }

}

