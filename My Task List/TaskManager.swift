//
//  TaskManager.swift
//  My Task List
//
//  Created by Gulzar on 3/9/17.
//  Copyright © 2017 Gulzar. All rights reserved.
//

import UIKit

var taskManager: TaskManager = TaskManager()

struct task {
        var named = "un-name"
        var desc = "un-descriped"
}


class TaskManager: NSObject {
    var tasks = [task]()
    
    func addTask (name: String, description: String)
    {
        tasks.append (task (named: name, desc: description))
        
    }

    
}
