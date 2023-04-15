//
//  ViewController.swift
//  FitnessApp
//
//  Created by Василий Васильевич on 15.04.2023.
//

import UIKit

class MainViewController: UIViewController {

    var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .specialBackground
    }
}

extension MainViewController {
    private func setConstraints() {

    }
}

