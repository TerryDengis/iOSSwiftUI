//
//  ViewController.swift
//  PizzaHistory
//
//  Created by Steven Lipton on 9/20/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBSegueAction func historyViewSegue(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder:coder, rootView:HistoryView())
    }
}

