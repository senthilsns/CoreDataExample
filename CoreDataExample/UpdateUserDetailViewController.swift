//
//  UpdateUserDetailViewController.swift
//  CoreDataExample
//
//  Created by SENTHILKUMAR on 14/11/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit
import CoreData

class UpdateUserDetailViewController: UIViewController {
    
    @IBAction func backButtonAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet var updateUsernameField: UITextField!
    @IBOutlet var updatePositionField: UITextField!
    @IBOutlet var statusLabel: UILabel!
    
    var usernameStr: String = ""
    var positionStr : String = ""
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        
        self.updateUsernameField.text = usernameStr
        self.updatePositionField.text = positionStr
    }
    
    
    
    @IBAction func updateDetailsAction(_ sender: Any) {
        
        updatePersonDetails()
        
    }
    
    //MARK: CoreDate --> Update
    func updatePersonDetails(){
        
        
        //Step 1: Container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //Step 2: We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "UserDetail")
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue(self.updateUsernameField.text!, forKey: "username")
            objectUpdate.setValue(self.updatePositionField.text!, forKey: "position")
            do{
                try managedContext.save()
                statusLabel.text = "Record Updates Success!!!"
            }
            catch
            {
                print(error)
            }
        }
        catch
        {
            print(error)
        }
        
        
    }
    


}
