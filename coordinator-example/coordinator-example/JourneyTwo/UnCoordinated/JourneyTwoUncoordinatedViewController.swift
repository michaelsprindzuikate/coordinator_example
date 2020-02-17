//
//  JourneyTwoUncoordinatedViewController.swift
//  coordinator-example
//
//  Created by Michael Sprindzuikate on 06/02/2020.
//  Copyright © 2020 moopydoopy. All rights reserved.
//

import UIKit

protocol JourneyTwoUncoordinatedViewControllerNavigationDelegate: class {
    func didNavigateForward()
}

class JourneyTwoUncoordinatedViewController: UIViewController {

    weak var delegate: JourneyTwoUncoordinatedViewControllerNavigationDelegate?
    var canAutomaticallyNavigateForward: Bool = false


    deinit {
        print("deinit \(self.description)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard canAutomaticallyNavigateForward == true else { return }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) { [weak self] in
            self?.delegate?.didNavigateForward()
        }
    }

}
