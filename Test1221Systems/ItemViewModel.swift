//
//  ItemViewModel.swift
//  Test1221Systems
//
//  Created by Андрей Бабкин on 16.08.2024.
//

import SwiftUI

class ItemViewModel: ObservableObject {
    @Published var itemsGrid: [Item] = []
    @Published var itemsList: [Item] = []
    
    init() {
        addProducts()
    }
    
    func addProducts() {
        itemsList = ItemViewModel.shopItemsList
        itemsGrid = ItemViewModel.shopItemsGrid
    }
    
        static let shopItemsList = [
            Item(image: "TeaImage", rating: "4.1", numberOfReviews: "19 отзывов", description: "Огурцы тепличные садово-огородные", country: false, priceRubles: 59, priceKopecks: 90, discountedPrice: "49,0", sale: true, promotion: .blowToPrice),
            Item(image: "Cucumbers", rating: "4.1", numberOfReviews: "19 отзывов", description: "Дорадо Охлажденная Непотрошеная 300-400г", country: true, priceRubles: 120, priceKopecks: 90, discountedPrice: "199,0", sale: true, promotion: .news),
            Item(image: "Adrenalin", rating: "4.1", numberOfReviews: "19 отзывов", description: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", country: true, priceRubles: 99, priceKopecks: 90, discountedPrice: "199,0", sale: false),
            Item(image: "Nuts", rating: "4.1", numberOfReviews: "19 отзывов", description: "Манго Кео", country: true, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: true, promotion: .blowToPrice),
            Item(image: "TeaImage", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: false, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: true),
            Item(image: "TeaImage", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: false, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: true),
            Item(image: "TeaImage", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: false, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: true),
            Item(image: "TeaImage", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: false, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: true)
        ]

        static let shopItemsGrid = [
            Item(image: "GridImage1", rating: "4.1", numberOfReviews: "19 отзывов", description: "Огурцы тепличные садово-огородные", country: false, priceRubles: 59, priceKopecks: 90, discountedPrice: "49,0", sale: false, promotion: .blowToPrice),
        Item(image: "GridImage2", rating: "4.1", numberOfReviews: "19 отзывов", description: "Дорадо Охлажденная Непотрошеная 300-400г", country: false, priceRubles: 120, priceKopecks: 90, discountedPrice: "199,0", sale: false),
        Item(image: "GridImage3", rating: "4.1", numberOfReviews: "19 отзывов", description: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", country: false, priceRubles: 99, priceKopecks: 90, discountedPrice: "199,0", sale: false),
            Item(image: "GridImage4", rating: "4.1", numberOfReviews: "19 отзывов", description: "Манго Кео", country: true, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0",  sale: true),
            Item(image: "GridImage5", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: false, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: false, promotion: .news),
            Item(image: "GridImage6", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: true, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: false, promotion: .priceByCard),
            Item(image: "GridImage7", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: false, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: true, promotion: .news),
        Item(image: "GridImage8", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: false, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: false),
        Item(image: "GridImage9", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: false, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: false),
            Item(image: "GridImage10", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: false, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: false, promotion: .blowToPrice),
        Item(image: "GridImage11", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: true, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: false),
            Item(image: "GridImage12", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: false, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: false, promotion: .news),
        Item(image: "GridImage13", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: true, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: false),
            Item(image: "GridImage14", rating: "4.1", numberOfReviews: "19 отзывов", description: "сыр Ламбер 500/0 230г", country: false, priceRubles: 95699, priceKopecks: 90, discountedPrice: "199,0", sale: false, promotion: .priceByCard)
        ]
}
