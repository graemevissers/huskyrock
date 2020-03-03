//
//  WallSelectViewController.swift
//  huskyrock
//
//  Created by Graeme Vissers on 3/2/20.
//  Copyright © 2020 Graeme Vissers. All rights reserved.
//

import UIKit

class WallSelectViewController: UIViewController {
    
    @IBOutlet weak var home: UIButton!
    @IBOutlet weak var theRoof: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        theRoof.layer.cornerRadius = 20.0
    }
}
