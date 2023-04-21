//
//  CalendarView.swift
//  FitnessApp
//
//  Created by Василий Васильевич on 21.04.2023.
//

import UIKit

class CalendarView: UIView {

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .red
        return collectionView
    }()

    private let idCalendarCell = "idCalendarCell"

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setConstraints()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }

    private func setupViews() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setDelegates() {
        //collectionView.delegate = self
        collectionView.dataSource = self

    }

}

// MARK: - UICollectionViewDataSource

extension CalendarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CalendarView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionViewTap")
    }
}

// MARK: - SetConstraints

extension CalendarView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}
