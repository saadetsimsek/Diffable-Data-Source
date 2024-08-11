//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by Saadet Şimşek on 08/08/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "firstCell")
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Second")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

//MARK: - Tableview Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 3 : 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
            cell.textLabel?.text = "First"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Second", for: indexPath)
            cell.textLabel?.text = "Second"
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "First section" : "Second section"
    }
}
