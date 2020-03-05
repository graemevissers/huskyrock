//
// CenterViewController.swift
//  huskyrock
//
//  Created by Graeme Vissers on 2/25/20.
//  Copyright © 2020 Graeme Vissers. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController {
    @IBOutlet weak var wallLabel: UILabel!
    @IBOutlet weak var routeView: UIImageView!
    @IBOutlet weak var routeLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var delegate: CenterViewControllerDelegate?
  
   // MARK: Button actions
    @IBAction func routesTapped(_ sender: Any) {
        delegate?.toggleLeftPanel()
    }
    
}

extension CenterViewController: SidePanelViewControllerDelegate {
    func didSelectRoute(_ route: Routes) {
        routeView.image = route.image
        routeLabel.text = route.title
        descriptionLabel.text = route.description
        gradeLabel.text = route.grade

        delegate?.collapseSidePanels()
    }
}

protocol CenterViewControllerDelegate {
    func toggleLeftPanel()
    func collapseSidePanels()
}
