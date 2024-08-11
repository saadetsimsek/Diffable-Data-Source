//
//  SecondViewController.swift
//  DiffableDataSource
//
//  Created by Saadet Şimşek on 11/08/2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    var diffableDataSource: UITableViewDiffableDataSource<Section, String>?
    
    var firstArray: [String] = []
    var secondArray: [String] = []

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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                           target: self,
                                                           action: #selector(leftAddTap))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(rightAddTap))
        setupDiffableDataSource()
    }
    
    @objc private func leftAddTap(){
        let randomNumber = Int.random(in: 1...10)
        firstArray.append("Random number: \(randomNumber)")
        updateDiffableDataSource()
        
    }
    
    @objc private func rightAddTap(){
        print("right")
        let randomNumber = Int.random(in: 1...10)
        secondArray.append("Random number \(randomNumber)")
        updateDiffableDataSource()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func setupDiffableDataSource(){
        diffableDataSource = UITableViewDiffableDataSource(tableView: self.tableView, cellProvider: { tableView, indexpath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexpath)
            cell.textLabel?.text = itemIdentifier
            return cell
        })
    }
    
    private func updateDiffableDataSource(){
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.first, .second])
        snapshot.appendItems(firstArray, toSection: .first)
        snapshot.appendItems(secondArray, toSection: .second)
        
        diffableDataSource?.apply(snapshot, animatingDifferences: true)
    }

}

//MARK: - Tableview Delegate


