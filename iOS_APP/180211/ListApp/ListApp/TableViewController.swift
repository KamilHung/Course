//
//  TableViewController.swift
//  ListApp
//
//  Created by cycu on 2018/2/4.
//  Copyright © 2018年 cycu. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    //var arrayOfData = [String]()
    var arrayOfData = [NSManagedObject]()

    @IBAction func addNote(_ sender: UIBarButtonItem) {
        let addNoteAlert = UIAlertController(title: "New Name", message: "Add a name to the list", preferredStyle: .alert)
        

        let saveAction = UIAlertAction(title: "Save", style: .default) { (AlertAction) in
            let textField = addNoteAlert.textFields?.first
            
            if textField!.text != "" {
                //self.arrayOfData.append(textField!.text!) //var arrayOfData = [String]()
                self.saveName(name: textField!.text!) // != "" check nil, so it's not check
                self.tableView.reloadData()
            }else{
                let errorAlert = UIAlertController(title: "Connot accept empty entry",
                                                   message: "Please enter at least 1 character",
                                                   preferredStyle: .alert)
                let errorAction = UIAlertAction(title: "OK", style: .default, handler: { (AlertAction) in
                    self.present(addNoteAlert, animated: true, completion: nil)
                })
                
                errorAlert.addAction(errorAction)
                self.present(errorAlert, animated: true, completion: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (AlertAction) in
        }
        
        
        addNoteAlert.addTextField { (TextField) in
            TextField.placeholder = "Name"
        }
        addNoteAlert.addAction(saveAction)
        addNoteAlert.addAction(cancelAction)
        
        present(addNoteAlert, animated: true, completion: nil)

    }
    
    func saveName(name: String){ //save to database
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: managedContext) //optional
        
        let note = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        note.setValue(name, forKey: "name")
        do{
            try managedContext.save() //attention! It's very important
            arrayOfData.append(note)
        }catch let error as NSError{
            print("Could not save: \(error), \(error.userInfo)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note") //Core Data P70
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            arrayOfData = results as! [NSManagedObject]
        }catch let error as NSError {
            print("Could not save: \(error), \(error.userInfo)")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "My Cell", for: indexPath)
        
        //cell.textLabel!.text = arrayOfData[indexPath.row] //var arrayOfData = [String]()
        let note = arrayOfData[indexPath.row]
        cell.textLabel!.text = note.value(forKey: "name") as? String
        //let test = note.value(forKey: "name") //used option button check "test" type , it's any?
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            
            managedContext.delete(arrayOfData[indexPath.row])
            do{
                try managedContext.save()
            }catch{
                
            }
            
            arrayOfData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
    }
    
    
    
    
}
