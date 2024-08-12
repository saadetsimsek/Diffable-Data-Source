//
//  ExampleModels.swift
//  DiffableDataSource
//
//  Created by Saadet Şimşek on 12/08/2024.
//

import Foundation

enum ExampleSection: CaseIterable {
    case subscribeType
    case payment
    case discount
}

enum ExampleRow: Hashable {
    case subscribeType(SubscribeModel)
    case payment(PaymentModel)
    case discount(DiscountModel)
}

struct SubscribeModel: Hashable {
    let image: String
    let name: String
    let description: String
}

struct PaymentModel: Hashable {
    let image: String
    let name: String
}

struct DiscountModel: Hashable {
    let image: String
    let name: String
}
