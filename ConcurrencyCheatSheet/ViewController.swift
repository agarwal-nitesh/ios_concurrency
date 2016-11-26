//
//  ViewController.swift
//  ConcurrencyCheatSheet
//
//  Created by Nitesh on 11/26/16.
//  Copyright © 2016 Nitesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Tasks {
    
    var tasks: [() -> Void]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playTasks()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController {
    
    func playTasks() {
        let taskVar1 = self.task1
        let taskVar2 = self.task2
        let taskVar3 = self.task3
        self.tasks = []
        self.tasks?.append(taskVar1)
        self.tasks?.append(taskVar2)
        self.tasks?.append(taskVar3)
//        self.executeSerially(self.tasks!)
        print("Execution is still in a separate thread!! Non blocking!")
//        self.executeConcurrently(self.tasks!)
        
        self.executeConcurrentlyWithCompletionHandler(self.tasks!) {
            print("All tasks completed!!!")
        }
    }
    
    func task1() {
        for _ in 0...10 {
            print("Hello from task1")
        }
    }
    
    func task2() {
        for _ in 0...10 {
            print("Hello from task2")
        }
    }
    
    func task3() {
        for _ in 0...10 {
            print("Hello from task3")
        }
    }
}


extension ViewController {
    func waitForTasks() {
        let queue = NSOperationQueue()
    }
}

