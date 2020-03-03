//
//  ViewController.swift
//  huskyrock
//
//  Created by Graeme Vissers on 2/25/20.
//  Copyright © 2020 Graeme Vissers. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var viewPDF: UIButton!
    @IBOutlet weak var viewRock: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewPDF.layer.cornerRadius = 20.0
        viewRock.layer.cornerRadius = 20.0
    }

}

