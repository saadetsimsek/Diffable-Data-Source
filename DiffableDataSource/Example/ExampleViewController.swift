//
//  ExampleViewController.swift
//  DiffableDataSource
//
//  Created by Saadet Şimşek on 12/08/2024.
//

import UIKit

class ExampleViewController: UIViewController {

    var diffableDataSource: UITableViewDiffableDataSource<ExampleRow, ExampleRow>?
    
    private var subscribeTypes: [ExampleRow] = []
    private var payment: [ExampleRow] = []
    private var discount: [ExampleRow] = []

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(SubscribeTableViewCell.self, forCellReuseIdentifier: SubscribeTableViewCell.identifier)
        table.register(PaymentTableViewCell.self, forCellReuseIdentifier: PaymentTableViewCell.identifier)
        table.register(DiscountTableViewCell.self, forCellReuseIdentifier: DiscountTableViewCell.identifier)
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "cmd+B, cmd+R"
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        setupDiffableDataSource()
        applySnapshot()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
 
    private func setupDiffableDataSource() {
        diffableDataSource = UITableViewDiffableDataSource(tableView: self.tableView, cellProvider: { tableView, indexpath, itemIdentifier in
            switch itemIdentifier {
            case .subscribeType(let model):
                let cell = tableView.dequeueReusableCell(withIdentifier: SubscribeTableViewCell.identifier, for: indexpath) as? SubscribeTableViewCell
                return cell
            case .payment(let model):
                let cell = tableView.dequeueReusableCell(withIdentifier: PaymentTableViewCell.identifier, for: indexpath) as? PaymentTableViewCell
                return cell
            case .discount(let model):
                let cell = tableView.dequeueReusableCell(withIdentifier: DiscountTableViewCell.identifier, for: indexpath) as? DiscountTableViewCell
                return cell
            }
        })
    }
    
    func applySnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<ExampleSection, ExampleRow>()
        snapshot.appendSections([.subscribeType, .payment, .discount])
        snapshot.appendItems(subscribeTypes, toSection: .subscribeType)
        snapshot.appendItems(payment, toSection: .payment)
        snapshot.appendItems(discount, toSection: .discount)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let header = ExampleSection.allCases[section]
        
        switch header {
        case .subscribeType:
            return "Subscribe"
        case .payment:
            return "Payment"
        case .discount:
            return "Discount"
        }
    }
}
 
    
   

