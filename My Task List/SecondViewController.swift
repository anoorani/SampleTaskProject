//
//  SecondViewController.swift
//  My Task List
//
//  Created by Gulzar on 3/9/17.
//  Copyright © 2017 Gulzar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var txtText: UITextField!
    @IBOutlet var txtDescription: UITextField!
    @IBOutlet var switchText: UISwitch!
    @IBOutlet var switchDescription: UISwitch!
    var textName : String? = nil
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if textName != nil {
            txtText.text = textName!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnAddTask_Click(_ sender: UIButton) {
        taskManager.addTask(name: txtText.text!, description: txtDescription.text!)
        self.view.endEditing(true)
        txtText.text = ""
        txtDescription.text = ""
        self.tabBarController?.selectedIndex = 0
    }
    
       
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder();
        return true
        
    }


}

