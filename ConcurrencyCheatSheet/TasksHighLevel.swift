//
//  TasksHighLevel.swift
//  ConcurrencyCheatSheet
//
//  Created by Nitesh on 11/26/16.
//  Copyright © 2016 Nitesh. All rights reserved.
//

import Foundation

protocol TasksHighLevel {
    var tasks: [()->Void]? {get set}
    
}

extension TasksHighLevel
//    where Self: NSObject
    {
    func executeConcurrently(tasks: [()->Void]) {
        let queue = NSOperationQueue()
        for task in tasks {
            queue.addOperationWithBlock(task)
        }
    }
    
    func executeSeriallyInMainQueue(tasks: [()->Void]) {
        let queue = NSOperationQueue.mainQueue()
        for task in tasks {
            queue.addOperationWithBlock(task)
        }
    }
    
    func executeSerially(tasks: [()->Void]) {
        let queue = NSOperationQueue()
        queue.maxConcurrentOperationCount = 1
        for task in tasks {
            queue.addOperationWithBlock(task)
        }
    }
    
    func executeConcurrentlyWithCompletionHandler(tasks: [()->Void], completion: ()->Void) {
        let queue = NSOperationQueue()
        queue.maxConcurrentOperationCount = 1
        for task in tasks {
            queue.addOperationWithBlock(task)
        }
        
//        queue.addObserver(self, forKeyPath: "operationCount", options: .New, context: nil)
        NSOperationQueue().addOperationWithBlock { 
            queue.waitUntilAllOperationsAreFinished()
            completion()
        }
    }
    
//    func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
//        
//        if keyPath == "operationCount" {
//            
//        }
//        
//    }
}
