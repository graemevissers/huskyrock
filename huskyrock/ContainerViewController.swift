//
//  ContainerViewController.swift
//  huskyrock
//
//  Created by Graeme Vissers on 2/25/20.
//  Copyright © 2020 Graeme Vissers. All rights reserved.
//

import UIKit
import QuartzCore

class ContainerViewController: UIViewController {
    
    
    enum SlideOutState {
        case bothCollapsed
        case leftPanelExpanded
    }
      
    var centerNavigationController: UINavigationController!
    var centerViewController: CenterViewController!
      
    var currentState: SlideOutState = .bothCollapsed {
        didSet {
            let shouldShowShadow = currentState != .bothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
      
    var leftViewController: SidePanelViewController?
    
    let centerPanelExpandedOffset: CGFloat = 90
      
    override func viewDidLoad() {
        super.viewDidLoad()
        // pull view controller from storyboard
        centerViewController = UIStoryboard.centerViewController()
        // set current view controller as the center view controller's delegate
        centerViewController.delegate = self
        //creates a navigation controller so views can be pushed to it
        centerNavigationController = UINavigationController(rootViewController: centerViewController)
        view.addSubview(centerNavigationController.view)
        addChild(centerNavigationController)
        centerNavigationController.didMove(toParent: self)
    }
}

private extension UIStoryboard {
  static func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
  
  static func leftViewController() -> SidePanelViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "LeftViewController") as? SidePanelViewController
  }
  static func centerViewController() -> CenterViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "CenterViewController") as? CenterViewController
  }
}

extension ContainerViewController: CenterViewControllerDelegate {
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func addLeftPanelViewController() {
        guard leftViewController == nil else {return}
        if let vc = UIStoryboard.leftViewController() {
            vc.routes = Routes.guideBookRoutes()
            addChildSidePanelController(vc)
            leftViewController = vc
        }
    }
    
    func animateLeftPanel(shouldExpand: Bool) {
        if shouldExpand {
          currentState = .leftPanelExpanded
          animateCenterPanelXPosition(
            targetPosition: centerNavigationController.view.frame.width
              - centerPanelExpandedOffset)
        } else {
          animateCenterPanelXPosition(targetPosition: 0) { _ in
            self.currentState = .bothCollapsed
            self.leftViewController?.view.removeFromSuperview()
            self.leftViewController = nil
          }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            options: .curveEaseInOut,
            animations: {
                self.centerNavigationController.view.frame.origin.x = targetPosition
            },
            completion: completion)
    }
    
    func addChildSidePanelController(_ sidePanelController: SidePanelViewController) {
        view.insertSubview(sidePanelController.view, at: 0)

        addChild(sidePanelController)
        sidePanelController.didMove(toParent: self)
        sidePanelController.delegate = centerViewController
    }
    
    func collapseSidePanels() {
        switch currentState {
        case .leftPanelExpanded:
            toggleLeftPanel()
        case .bothCollapsed:
            break
        }
    }
    
    func showShadowForCenterViewController(_ shouldShowShadow: Bool) {
      if shouldShowShadow {
        centerNavigationController.view.layer.shadowOpacity = 0.8
      } else {
        centerNavigationController.view.layer.shadowOpacity = 0.0
      }
    }
}


