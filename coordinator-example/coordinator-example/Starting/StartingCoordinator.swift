//
//  StartingCoordinator.swift
//  coordinator-example
//
//  Created by Michael Sprindzuikate on 06/02/2020.
//  Copyright © 2020 moopydoopy. All rights reserved.
//

import UIKit

final class StartingCoordinator: Coordinator {

    var coordinatorFlowComplete: (() -> Void)?
    var rootViewController: UINavigationController

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }

    deinit {
        print("Starting Coordinator Deallocated")
    }

    func start() {

        let startingViewController = StartingViewController()
        startingViewController.coordinator = self
        startingViewController.delegate = self

        rootViewController.pushViewController(startingViewController, animated: true)
    }
}

extension StartingCoordinator: StartingViewControllerNavigationDelegate {

    func didPressJourneyOneButton() {

        let journeyOneCoordinator = JourneyOneCoordinator(rootViewController: rootViewController)
        journeyOneCoordinator.start()
    }

    func didPressJourneyTwoButton() {

        let journeyTwoCoordinator = JourneyTwoCoordinator(rootViewController: rootViewController)
        journeyTwoCoordinator.start()
    }

    func didPressJourneyThreeButton() {

        let journeyThreeCoordinator = JourneyThreeCoordinator(rootViewController: rootViewController)
        journeyThreeCoordinator.start()
    }

    func didPressTheEndButton() {
        coordinatorFlowComplete?()
    }
}
