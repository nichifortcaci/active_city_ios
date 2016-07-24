//
//  TableViewCell.swift
//  active_city
//
//  Created by Eugen Dascal on 7/23/16.
//  Copyright © 2016 Syrbu Konstantin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var like: UIButton!
    @IBOutlet weak var comment: UIButton!
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var user: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func commentClick(sender: AnyObject) {
        
        UIView.animateWithDuration(0.2 ,
                                   animations: {
                                    self.comment.transform = CGAffineTransformMakeScale(0.6, 0.6)
            },
                                   completion: { finish in
                                    UIView.animateWithDuration(0.2){
                                        self.comment.transform = CGAffineTransformIdentity
                                    }
        })
    }
    
    @IBAction func shareClick(sender: AnyObject) {
        
        UIView.animateWithDuration(0.2 ,
                                   animations: {
                                    self.share.transform = CGAffineTransformMakeScale(0.6, 0.6)
            },
                                   completion: { finish in
                                    UIView.animateWithDuration(0.2){
                                        self.share.transform = CGAffineTransformIdentity
                                    }
        })
    }

    @IBAction func likeClick(sender: AnyObject) {
        
        UIView.animateWithDuration(0.2 ,
                                   animations: {
                                    self.like.transform = CGAffineTransformMakeScale(0.6, 0.6)
            },
                                   completion: { finish in
                                    UIView.animateWithDuration(0.2){
                                        self.like.transform = CGAffineTransformIdentity
                                    }
        })
       
        
        if let myNumber = NSNumberFormatter().numberFromString(likes.text!) {
            var myInt = myNumber.integerValue + 1
            likes.text = "\(Int(myInt))"
            // do what you need to do with myInt
        } else {
            // what ever error code you need to write
        }

    }
}
