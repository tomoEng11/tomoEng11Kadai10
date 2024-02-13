//
//  ViewController.swift
//  tomoEng11Kadai10
//
//  Created by 井本智博 on 2024/02/10.
//

import UIKit

class ViewController: UIViewController {
    private let cellClassName = "CustomTableViewCell"
    private let reuseId = "CustomTableViewCell"
    private let prefectures = Model().prefectures
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: cellClassName, bundle: nil), forCellReuseIdentifier: reuseId)
    }
}
//MARK: - TableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
//MARK: - TableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = prefectures[indexPath.row]
        cell.descriptionLabel.text = "\(indexPath.row + 1)番目の都道府県です"
        cell.backgroundColor = colorForIndexPath(indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
    }

    private func colorForIndexPath(_ indexPath: IndexPath) -> UIColor {
        let colorIndex = (indexPath.row + 1) % 3
               switch colorIndex {
               case 0: return .systemBlue
               case 1: return .systemPink
               case 2: return .systemGreen
               default: return .clear
               }
    }
}
