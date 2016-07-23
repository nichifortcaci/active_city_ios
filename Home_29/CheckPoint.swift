//
//  File.swift
//  active_city
//
//  Created by Eugen Dascal on 7/23/16.
//  Copyright © 2016 Syrbu Konstantin. All rights reserved.
//

import Foundation
import UIKit

class CheckPoint {
    var id = Int()
    var title = String()
    var content = String()
    var media = String()
    var location = Position()
    var categoryId = Int()
    var startDatetime = String()
    var endDatetime = String()
}