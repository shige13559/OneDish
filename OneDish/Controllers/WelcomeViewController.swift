//
//  WelcomeViewController.swift
//  OneDish
//
//  Created by 原田茂大 on 2019/12/16.
//  Copyright © 2019 geshi. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didClickButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toLogin", sender: nil)
        
    }
    
}
