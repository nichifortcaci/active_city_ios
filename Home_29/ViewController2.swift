//
//  ViewController2.swift
//  Home_29
//
//  Created by Admin on 04.05.16.
//  Copyright © 2016 Syrbu Konstantin. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var howAreYouLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.7) {
            self.howAreYouLabel.frame.origin.x = self.view.center.x-50
            self.howAreYouLabel.frame.origin.y = self.view.center.y-85
        }
    }
}
