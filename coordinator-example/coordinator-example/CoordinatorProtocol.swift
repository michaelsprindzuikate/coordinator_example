//
//  CoordinatorProtocol.swift
//  coordinator-example
//
//  Created by Michael Sprindzuikate on 06/02/2020.
//  Copyright © 2020 moopydoopy. All rights reserved.
//

import Foundation

protocol Coordinator {
    func start()
    func flowComplete()

    var coordinatorFlowComplete: (() -> Void)? { get set }
}

extension Coordinator {
    func flowComplete() {
        coordinatorFlowComplete?()
    }
}

protocol CoordinatedViewController: class {
    var coordinator: Coordinator? { get set }
    var viewDeinit: (() -> Void)? { get set }
}
