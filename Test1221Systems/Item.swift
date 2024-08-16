//
//  Model.swift
//  Test1221Systems
//
//  Created by Андрей Бабкин on 07.08.2024.
//

import Foundation
import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var image: String
    var rating: String
    var numberOfReviews: String
    var description: String
    var country: Bool
    var priceRubles: Int
    var priceKopecks: Int
    var discountedPrice: String
    var sale: Bool
    var promotion: Promotion?
    
    enum Promotion {
        case blowToPrice
        case news
        case priceByCard
    }
}


