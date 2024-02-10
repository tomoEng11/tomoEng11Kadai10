//
//  ViewController.swift
//  tomoEng11Kadai10
//
//  Created by 井本智博 on 2024/02/10.
//

import UIKit

class ViewController: UIViewController {
    private let prefectures = Model().prefectures
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = prefectures[indexPath.row]
        cell.descriptionLabel.text = "\(indexPath.row + 1)番目の都道府県です"

        if (indexPath.row + 1) % 3 == 0 {
            cell.backgroundColor = .red
        } else if (indexPath.row + 1) % 3 == 1 {
            cell.backgroundColor = .blue
        } else if (indexPath.row + 1) % 3 == 2 {
            cell.backgroundColor = .green
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
    }
}
