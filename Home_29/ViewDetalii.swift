//
//  ViewDetalii.swift
//  active_city
//
//  Created by Eugen Dascal on 7/23/16.
//  Copyright © 2016 Syrbu Konstantin. All rights reserved.
//

import UIKit

class ViewDetalii: UIViewController {
    
    var checkPoint = CheckPoint()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = checkPoint.title
        messageLabel.text = checkPoint.content
        categoryLabel.text = "\(checkPoint.categoryId)"
        position.text = checkPoint.location.latitude + "\n" + checkPoint.location.longitude
        //image.image = checkPoint.image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var position: UILabel!
    
    
    @IBOutlet weak var image: UIImageView!


}
