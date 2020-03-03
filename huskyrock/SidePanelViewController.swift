//
//  RouteSelectViewController.swift
//  huskyrock
//
//  Created by Graeme Vissers on 2/25/20.
//  Copyright © 2020 Graeme Vissers. All rights reserved.
//

import UIKit

class SidePanelViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: SidePanelViewControllerDelegate?
    
    var routes: [Routes]!
    
    enum CellIdentifiers {
        static let RouteCell = "RouteCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
    }
}

extension SidePanelViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.RouteCell, for:               indexPath) as! RouteCell
        cell.configureForRoute(routes[indexPath.row])
        return cell
    }
}

extension SidePanelViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let route = routes[indexPath.row]
        delegate?.didSelectRoute(route)
    }
}

protocol SidePanelViewControllerDelegate {
    func didSelectRoute(_ route: Routes)
}
