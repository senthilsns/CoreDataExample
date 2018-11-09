//
//  ViewController.swift
//  CoreDataExample
//
//  Created by SENTHIL on 09/11/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit
import  CoreData

class ViewController: UIViewController {
    
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var positionField: UITextField!
    @IBOutlet var statusLabel: UILabel!
    
    //MARK: Save Button
    @IBAction func saveAction(_ sender: Any) {
        
        if (userNameField.text?.isEmpty)! {
            statusLabel.text = "User Name Field Empty"
        } else if (positionField.text?.isEmpty)! {
            statusLabel.text = "Position Field Empty"
        } else {
            statusLabel.text = ""
            saveInDB(username: userNameField.text!, position: positionField.text!)
        }
        
    }
    
    func clear() {
        userNameField.text = ""
        positionField.text = ""
    }
    
    func saveInDB (username:String,position:String) {
        
        // Core Data ---> Save

        // Step 1: Container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // Step 2: We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Step 3: Create an entity and new user records
        let entity = NSEntityDescription.entity(forEntityName: "UserDetail", in: managedContext)
        let newUser = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        // Step 4: we need to add some data to our newly created record
        newUser.setValue(username, forKey: "username")
        newUser.setValue(position, forKey: "position")
        
        // Step 5: Set all the values. The next step is to save them inside the Core Data
        
        do {
            // Save Person Details
            try managedContext.save()
            // Additional
            additionalThings()

        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.isNavigationBarHidden = true

    }

    func additionalThings() {
        
        // Clear Text Fields
        clear()
        statusLabel.text = "Data Saved !!!"
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    

}

