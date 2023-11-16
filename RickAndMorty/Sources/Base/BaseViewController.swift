//
//  BaseViewController.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 04.11.2023.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .baseWhite
    }
}
