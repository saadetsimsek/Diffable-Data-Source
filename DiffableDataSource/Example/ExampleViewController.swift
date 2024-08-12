//
//  ExampleViewController.swift
//  DiffableDataSource
//
//  Created by Saadet Şimşek on 12/08/2024.
//

import UIKit

class ExampleViewController: UIViewController{

    var diffableDataSource: UITableViewDiffableDataSource<ExampleSection, ExampleRow>?
    
    private var subscribeTypes: [ExampleRow] = [.subscribeType(SubscribeModel.betaSubs),
        .subscribeType(SubscribeModel.juniorSubs)]
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
        
        title = "Subscription"
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        setupDiffableDataSource()
        applySnapshot()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
 
    private func setupDiffableDataSource() {
        diffableDataSource = UITableViewDiffableDataSource<ExampleSection, ExampleRow>(tableView: self.tableView, cellProvider: { tableView, indexpath, itemIdentifier in
            switch itemIdentifier {
                
            case .subscribeType(let model):
                let cell = tableView.dequeueReusableCell(withIdentifier: SubscribeTableViewCell.identifier, for: indexpath) as? SubscribeTableViewCell
                cell?.configure(model)
                return cell
                
            case .payment(let model):
                let cell = tableView.dequeueReusableCell(withIdentifier: PaymentTableViewCell.identifier, for: indexpath) as? PaymentTableViewCell
                cell?.configure(model)
                return cell
                
            case .discount(let model):
                let cell = tableView.dequeueReusableCell(withIdentifier: DiscountTableViewCell.identifier, for: indexpath) as? DiscountTableViewCell
                cell?.configure(model)
                return cell
            }
        })
        
    }
    
    func applySnapshot(){
        print("content")
        var snapshot = NSDiffableDataSourceSnapshot<ExampleSection, ExampleRow>()
        snapshot.appendSections([.subscribeType, .payment, .discount])
        snapshot.appendItems(subscribeTypes, toSection: .subscribeType)
        snapshot.appendItems(payment, toSection: .payment)
        snapshot.appendItems(discount, toSection: .discount)
        
        diffableDataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    //Çalışmıyor
 /*   private func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
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
  */
}
 
extension ExampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = self.diffableDataSource?.itemIdentifier(for: indexPath) else {
            return
        }
        switch item {
        case .subscribeType(let subscribeModel):
            discount = []
            if indexPath.row == 0 {
                payment = [PaymentModel.visa,
                           PaymentModel.masterCard]
                    .map{ .payment($0) }
            }else{
                payment = [PaymentModel.visa,
                           PaymentModel.masterCard,
                           PaymentModel.mir]
                    .map{ .payment($0) }
            }
        case .payment(let paymentModel):
            switch indexPath.row {
            case 0:
                discount = []
            case 1:
                discount = []
            default:
                discount = [DiscountModel.discount25]
                    .map{ .discount($0)}
            }
        case .discount(let discountModel):
            print("Your 25% discount")
        }
        applySnapshot()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 60
        case 1:
            return 40
        default:
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = ExampleSection.allCases[section]
        let headerView = UIView()
        headerView.backgroundColor = .systemGroupedBackground
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textColor = .label
        
        switch section {
        case .subscribeType:
            titleLabel.text = "Subscribe"
        case .payment:
            titleLabel.text = "Payment"
        case .discount:
            titleLabel.text = "Discount"
        }
        
        headerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15)
        ])
        return headerView
    }
}
    
   

