//
//  ViewController.swift
//  coordinator-example
//
//  Created by Michael Sprindzuikate on 06/02/2020.
//  Copyright © 2020 moopydoopy. All rights reserved.
//

import UIKit

protocol StartingViewControllerNavigationDelegate: class {
    func didPressJourneyOneButton()
    func didPressJourneyTwoButton()
    func didPressJourneyThreeButton()
    func didPressTheEndButton()
}

class StartingViewController: UIViewController, CoordinatedViewController {

    var coordinator: Coordinator?
    var viewDeinit: (() -> Void)?

    weak var delegate: StartingViewControllerNavigationDelegate?

    deinit {
        print("deinit starting view controller")
        viewDeinit?()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didPressJourneyOne() {
        delegate?.didPressJourneyOneButton()
    }

    @IBAction func didPressJourneyTwo() {
        delegate?.didPressJourneyTwoButton()
    }

    @IBAction func didPressJourneyThree(_ sender: Any) {
        delegate?.didPressJourneyThreeButton()
    }

    @IBAction func didPressTheEnd(_ sender: Any) {
        delegate?.didPressTheEndButton()
    }
}

