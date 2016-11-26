//
//  Tasks.swift
//  ConcurrencyCheatSheet
//
//  Created by Nitesh on 11/26/16.
//  Copyright © 2016 Nitesh. All rights reserved.
//

import Foundation

protocol Tasks {
    var tasks: [()->Void]? {get set}
    
}

extension Tasks {
    func executeConcurrently(tasks: [()->Void]) {
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        for task in tasks {
            dispatch_async(queue, task)
        }
    }
    
    func executeSeriallyInMainQueue(tasks: [()->Void]) {
        let queue = dispatch_get_main_queue()
        
        for task in tasks {
            dispatch_async(queue, task)
        }
    }
    
    func executeSerially(tasks: [()->Void]) {
        let queue = dispatch_queue_create("com.concurrency_cheat_sheet.serialqueue", DISPATCH_QUEUE_SERIAL)
        
        for task in tasks {
            dispatch_async(queue, task)
        }
    }
    
    func executeConcurrentlyWithCompletionHandler(tasks: [()->Void], completion: ()->Void) {
        let group = dispatch_group_create()
        
        let queue = dispatch_queue_create("com.concurrency_cheat_sheet.concurrentqueue", DISPATCH_QUEUE_CONCURRENT)
        
        for task in tasks {
            dispatch_group_async(group, queue, task)
        }
        dispatch_group_notify(group, queue) { 
            completion()
        }
    }
}
