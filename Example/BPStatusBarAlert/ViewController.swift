//
//  ViewController.swift
//  BPStatusBarAlert
//
//  Created by taehyun.park on 01/25/2017.
//  Copyright (c) 2017 taehyun.park. All rights reserved.
//

import UIKit
import BPStatusBarAlert

class ViewController: UIViewController {

    override func viewDidLoad() {        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: Any) {
//        BPStatusBarAlert.shared.show(position: .statusBar, message: "Complete sharing this article!")
        BPStatusBarAlert.shared.show(position: .navigationBar, message: "Complete sharing this article!")
    }
}

