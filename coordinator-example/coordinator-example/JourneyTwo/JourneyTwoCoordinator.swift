//
//  JourneyTwoCoordinator.swift
//  coordinator-example
//
//  Created by Michael Sprindzuikate on 06/02/2020.
//  Copyright © 2020 moopydoopy. All rights reserved.
//

import UIKit

final class JourneyTwoCoordinator: Coordinator {

    var coordinatorFlowComplete: (() -> Void)?
    var rootViewController: UINavigationController
    weak var modalNavigationController: UINavigationController?

    var automaticallyMoveForward: Bool = true

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }

    deinit {
        print("Journey Two Coordinator Deallocated")
    }

    func start() {

        let journeyTwoStartViewController = JourneyTwoStartViewController()
        journeyTwoStartViewController.coordinator = self
        journeyTwoStartViewController.delegate = self
        journeyTwoStartViewController.viewDeinit = {
            self.coordinatorFlowComplete?()
        }

        let modalNavController = UINavigationController(rootViewController: journeyTwoStartViewController)
        modalNavigationController = modalNavController
        rootViewController.present(modalNavController, animated: true, completion: nil)
    }
}

extension JourneyTwoCoordinator: JourneyTwoStartNavigationDelegate {

    func stepForward() {
        
        let journeyStepTwoViewController = JourneyTwoUncoordinatedViewController()
        journeyStepTwoViewController.delegate = self
        journeyStepTwoViewController.canAutomaticallyNavigateForward = automaticallyMoveForward
        modalNavigationController?.pushViewController(journeyStepTwoViewController, animated: true)
    }

    func dismiss() {
        modalNavigationController?.dismiss(animated: true, completion: nil)
    }
}

extension JourneyTwoCoordinator: JourneyTwoUncoordinatedViewControllerNavigationDelegate {

    func didNavigateForward() {
        automaticallyMoveForward = false
        stepForward()
    }
}
