//
//  JourneyThreeStartingViewController.swift
//  coordinator-example
//
//  Created by Michael Sprindzuikate on 07/02/2020.
//  Copyright © 2020 moopydoopy. All rights reserved.
//

import UIKit

protocol JourneyThreeStartingViewControllerNavigationDelegate: class {
    func didTapBegin()
}

class JourneyThreeStartingViewController: UIViewController, CoordinatedViewController {

    var coordinator: Coordinator?
    var viewDeinit: (() -> Void)?

    weak var delegate: JourneyThreeStartingViewControllerNavigationDelegate?

    deinit {
        print("deinit \(self.description)")
        viewDeinit?()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapBegin(_ sender: Any) {
        delegate?.didTapBegin()
    }
}
