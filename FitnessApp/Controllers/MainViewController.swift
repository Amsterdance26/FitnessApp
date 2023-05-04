//
//  ViewController.swift
//  FitnessApp
//
//  Created by Василий Васильевич on 15.04.2023.
//

import UIKit

class MainViewController: UIViewController {

    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sergey Gorbachev"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.setTitle("Add workout", for: .normal)
        button.titleLabel?.font = .robotoMedium12()
        button.tintColor = .specialDarkGreen
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 15, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 50, left: -40, bottom: 0, right: 0)
        button.setImage(UIImage(named: "addWorkout"), for: .normal)
        button.addShadowOnView()
        button.addTarget(MainViewController.self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let workOutTodayLabel: UILabel = {
        let label = UILabel()
        label.text = "Workout today"
        label.textColor = .specialLightBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .red
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()


    private let calendarView = CalendarView()

    private let idWorkoutTabeleViewCell = "idWorkoutTabeleViewCell"

    override func viewDidLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius  = userPhotoImageView.frame.width / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        setDelegate()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idWorkoutTabeleViewCell)
    }

    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupViews() {
        view.backgroundColor = .specialBackground

        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(workOutTodayLabel)
        view.addSubview(tableView)
    }

    @objc private func addWorkoutButtonTapped() {
        print("addWorkoutButtonTapped")
    }
}
// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idWorkoutTabeleViewCell, for: indexPath)

        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

// MARK: - Set constraints
extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
        ])

        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 5),
            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])

        NSLayoutConstraint.activate([
            addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80)
        ])

        NSLayoutConstraint.activate([
            workOutTodayLabel.topAnchor.constraint(equalTo: addWorkoutButton.bottomAnchor, constant: 10),
            workOutTodayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])

        NSLayoutConstraint.activate([
            workOutTodayLabel.topAnchor.constraint(equalTo: addWorkoutButton.bottomAnchor, constant: 10),
            workOutTodayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: workOutTodayLabel.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0), // fixed line
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)  // fixed line
        ])

    }
}

