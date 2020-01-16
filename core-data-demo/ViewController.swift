//
//  ViewController.swift
//  core-data-demo
//
//  Created by MacStudent on 2020-01-16.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // First we create an instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        /*
          second we need the context
         this context is the manager like location manager , audio manager etc.
         */
        let context = appDelegate.persistentContainer.viewContext
        
        //3rd step write into context
//        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
//        newUser.setValue("Anmol", forKey: "name")
//        newUser.setValue(6478623467, forKey: "phone")
//        newUser.setValue("koursatveer12@gmail.ca", forKey: "email")
//        newUser.setValue(24, forKey: "age")
//
//        // 4th step - save context
//        do {
//           try  context.save()
//            print(newUser, "is added")
//        } catch{
//            print("error")
//        }
        // fetch data from database and load it
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
      //  request.predicate = NSPredicate(format: "email contains %@", ".com")
     //   request.predicate = NSPredicate(format: "email=%@", "koursatveer12@gmail.com" )
        request.returnsObjectsAsFaults = false
        // we find our data
        do{
            let results = try context.fetch(request)
            if results.count>0{
                for result in results as! [NSManagedObject]{
//                    if let name = result.value(forKey: "name"){
//                        print(name)
////                    }
//                    if let email = result.value(forKey: "email"){
//                        print(email)
//                        // update email address to ".com"
//                        let email = email as! String
//                        // update core data
//                        result.setValue(String(email.dropLast(2)) + "com", forKey: "email")
//                          do {
//                                   try  context.save()
//                                    //print(newUser, "is added")
//                                } catch{
//                                    print("error")
//                                }
//                        print(email)
//                    delete the user name
                    if let name = result.value(forKey: "name") as?
                        String{
                        context.delete(result)
                        do {
                        try  context.save()
                        } catch{
                     print("error")
                    }
                        print(name)
                        
                    }
                        
                    }
                }
            }
        catch{
            print("error")
        }
        
    }


}

