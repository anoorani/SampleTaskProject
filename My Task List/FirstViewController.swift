//
//  FirstViewController.swift
//  My Task List
//
//  Created by Gulzar on 3/9/17.
//  Copyright © 2017 Gulzar. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblTasks : UITableView!

    @IBOutlet weak var editBtn: UIButton!
    
    var tapped: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
    }
    
    func singleTap(){
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            if taskManager.tasks[0] != nil{
            viewController.textName = taskManager.tasks[0].named
                self.tabBarController?.selectedIndex = 1
                let vc = self.tabBarController?.selectedViewController as! SecondViewController
                vc.textName = taskManager.tasks[0].named
                vc.viewWillAppear(false)
//        present(viewController, animated: true, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return taskManager.tasks.count
        
    }
    @IBAction func editPressed(_ sender: Any) {
//        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
//                present(viewController, animated: true, completion: nil)
//        }
    
    }

    
    //Returning To View
    override func viewWillAppear(_ animated: Bool) {
        tblTasks.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.delete)
        {
            taskManager.tasks.remove(at: indexPath.row)
            tblTasks.reloadData()
            
        }
        
    }

    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
        
    {
        
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "test")
        cell.textLabel?.text = taskManager.tasks[indexPath.row].named
        cell.detailTextLabel?.text =  taskManager.tasks[indexPath.row].desc
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
    
        return cell
    }
    



}

