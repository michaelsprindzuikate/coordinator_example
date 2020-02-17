//
//  JourneyThreeCoordinator.swift
//  coordinator-example
//
//  Created by Michael Sprindzuikate on 07/02/2020.
//  Copyright © 2020 moopydoopy. All rights reserved.
//

import UIKit

final class JourneyThreeCoordinator: Coordinator {

    var coordinatorFlowComplete: (() -> Void)?
    var rootViewController: UINavigationController

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }

    deinit {
        print("Journey Three Coordinator Deallocated")
    }

    func start() {

        let journeyThreeStartingViewController = JourneyThreeStartingViewController()
        journeyThreeStartingViewController.coordinator = self
        journeyThreeStartingViewController.delegate = self

        rootViewController.pushViewController(journeyThreeStartingViewController, animated: true)
    }
}

extension JourneyThreeCoordinator: JourneyThreeStartingViewControllerNavigationDelegate {

    func didTapBegin() {

        let journeyOneAgain = JourneyOneCoordinator(rootViewController: rootViewController)
        journeyOneAgain.coordinatorFlowComplete = {
            self.rootViewController.popToRootViewController(animated: true)
        }

        journeyOneAgain.start()
    }
}
