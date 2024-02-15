//
//  ViewController.swift
//  tomoEng11Kadai10
//
//  Created by 井本智博 on 2024/02/10.
//

import UIKit

class ViewController: UIViewController {
    private let reuseId = "CustomTableViewCell"
    private let prefectures = Model().prefectures
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseId)
        tableView.allowsSelection = false
    }
}

//MARK: - TableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)

        var contentConfiguration = UIListContentConfiguration.valueCell()
        contentConfiguration.text = prefectures[indexPath.row]
        contentConfiguration.secondaryText = "\(indexPath.row + 1)番目の都道府県です"
        cell.contentConfiguration = contentConfiguration

        var backgroundConfiguration = cell.defaultBackgroundConfiguration()
        backgroundConfiguration.backgroundColor = colorForIndexPath(indexPath)
        cell.backgroundConfiguration = backgroundConfiguration

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    private func colorForIndexPath(_ indexPath: IndexPath) -> UIColor {
        let colorIndex = indexPath.row % 3

        switch colorIndex {
        case 0: return .systemPink
        case 1: return .systemGreen
        default: return .systemBlue
        }
    }
}
