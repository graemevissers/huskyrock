//
//  RouteCell.swift
//  huskyrock
//
//  Created by Graeme Vissers on 2/27/20.
//  Copyright © 2020 Graeme Vissers. All rights reserved.
//

import UIKit

class RouteCell: UITableViewCell {
    @IBOutlet weak var routeGrade: UILabel!
    @IBOutlet weak var routeName: UILabel!
    
    func configureForRoute(_ routes: Routes) {
        routeName.text = routes.title
        routeGrade.text = routes.grade
    }
}
