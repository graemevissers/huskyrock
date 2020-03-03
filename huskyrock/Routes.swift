//
//  Routes.swift
//  huskyrock
//
//  Created by Graeme Vissers on 2/26/20.
//  Copyright © 2020 Graeme Vissers. All rights reserved.
//

import UIKit

struct Routes {
    let title: String
    let grade: String
    let image: UIImage?
    let description: String
  
    init(title: String, grade: String, image: UIImage?, description: String) {
        self.title = title
        self.grade = grade
        self.image = image
        self.description = description
    }
  
    static func guideBookRoutes() -> [Routes] {
        return [
            Routes(title: "Dynosaur", grade: "Mod Hard", image:  UIImage(named: "smiley"), description: "ARF, SEMI-DANGEROUS. Two quick and hot dynos to the top. Master this route and win the loyalty and respect of all. Can be done statically at the price of style.")
        ]
    }
}
