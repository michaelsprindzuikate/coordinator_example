//
//  JourneyStepViewController.swift
//  coordinator-example
//
//  Created by Michael Sprindzuikate on 06/02/2020.
//  Copyright © 2020 moopydoopy. All rights reserved.
//

import UIKit

protocol JourneyStepNavigationDelegate: class {
    func goForward()
}

class JourneyStepViewController: UIViewController, CoordinatedViewController {

    var coordinator: Coordinator?
    var viewDeinit: (() -> Void)?

    @IBOutlet private weak var viewTitle: UILabel?
    @IBOutlet private weak var forwardButton: UIButton?

    var hideForwardButton: Bool = false
    var stepTitle: String?
    var viewBackground: UIColor = .white

    weak var delegate: JourneyStepNavigationDelegate?

    deinit {
        print("deinit \(self.description)")
        viewDeinit?()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.backgroundColor = viewBackground
        viewTitle?.text = stepTitle
        forwardButton?.isHidden = hideForwardButton
    }

    @IBAction func didTapGoForward() {
        delegate?.goForward()
    }
}
