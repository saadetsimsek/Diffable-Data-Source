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
    
    static let betaSubs: Self = .init(image: "beta",
                                      name: "Beta-subs",
                                      description: "Access the video 2 weeks before the previous date YouTube")
    static let juniorSubs: Self = .init(image: "junior",
                                      name: "Junior-subs",
                                      description: "Beta subscriptions + chat + project files")
}

struct PaymentModel: Hashable {
    let image: String
    let name: String
    
    static let visa: Self = .init(image: "visa", name: "Visa")
    static let masterCard: Self = .init(image: "mastercard", name: "Master Card")
    static let mir: Self = .init(image: "mir", name: "MIR")
}

struct DiscountModel: Hashable {
    let image: String
    let name: String
    
    static let discount25: Self = .init(image: "discount", name: "25% discount")
}
