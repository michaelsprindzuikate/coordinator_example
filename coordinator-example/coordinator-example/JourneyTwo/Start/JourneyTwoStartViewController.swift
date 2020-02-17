//
//  JourneyTwoStartViewController.swift
//  coordinator-example
//
//  Created by Michael Sprindzuikate on 06/02/2020.
//  Copyright © 2020 moopydoopy. All rights reserved.
//

import UIKit

protocol JourneyTwoStartNavigationDelegate: class {
    func stepForward()
    func dismiss()
}

    

class JourneyTwoStartViewController: UIViewController, CoordinatedViewController {

    var coordinator: Coordinator?
    var viewDeinit: (() -> Void)?

    weak var delegate: JourneyTwoStartNavigationDelegate?

    deinit {
        print("deinit \(self.description)")
        viewDeinit?()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func stepForward() {
        delegate?.stepForward()
    }

    @IBAction func dismissView() {
        delegate?.dismiss()
    }
}
