//
//  JourneyOneCoordinator.swift
//  coordinator-example
//
//  Created by Michael Sprindzuikate on 06/02/2020.
//  Copyright © 2020 moopydoopy. All rights reserved.
//

import UIKit

final class JourneyOneCoordinator: Coordinator {

    var coordinatorFlowComplete: (() -> Void)?
    var rootViewController: UINavigationController

    var hasStepTwoBeenSeenBefore: Bool = false

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }

    deinit {
        print("Journey One Coordinator Deallocated")
    }

    func start() {

        let journeyStepViewController = JourneyStepViewController()
        journeyStepViewController.coordinator = self
        journeyStepViewController.delegate = self

        journeyStepViewController.viewBackground = .green
        journeyStepViewController.stepTitle = "Journey One - Step One"

        rootViewController.pushViewController(journeyStepViewController, animated: true)
    }
}

extension JourneyOneCoordinator: JourneyStepNavigationDelegate {

    func goForward() {

        let journeyStepTwoViewController = JourneyStepViewController()
        journeyStepTwoViewController.viewBackground = .yellow
        journeyStepTwoViewController.stepTitle = hasStepTwoBeenSeenBefore ? "You've been here before!" : "Journey One - Step Two"
        journeyStepTwoViewController.hideForwardButton = true

        journeyStepTwoViewController.viewDeinit = {
            self.hasStepTwoBeenSeenBefore = true
            self.coordinatorFlowComplete?()
        }

        rootViewController.pushViewController(journeyStepTwoViewController, animated: true)
    }
}
