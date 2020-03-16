//
//  NSManagedContextExtension.swift
//  HotCoffeeApp
//
//  Created by Terry Dengis on 11/9/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
        return appDelegate.persistentContainer.viewContext
    }
}
