//
//  GridView.swift
//  Test1221Systems
//
//  Created by Андрей Бабкин on 08.08.2024.
//

import SwiftUI

struct GridView: View {
    @ObservedObject var viewModel = ItemViewModel()
    var colums = Array(repeating: GridItem(.flexible(), spacing: 5), count: 2)
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums, spacing: 10) {
                ForEach(viewModel.itemsGrid) { item in
                    GridItemShopView(item: item)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct GridItemShopView: View {
    @State private var quantityOfGoodsInTheBasket = 0
    @State private var pickerSelection = 0
    @State private var likeIsTapped: Bool = false
    @State private var basketIsTapped: Bool = false
    var item: Item
    var body: some View {
        GeometryReader { reader in
            ZStack {
                VStack(spacing: 5) {
                    GeometryReader { imageReader in
                        Image(item.image)
                            .scaledToFit()
                            .frame(width: reader.size.width, height: reader.size.height * 0.55)
                    }
                    GeometryReader { secondReader in
                        VStack(spacing: 2) {
                            HStack(spacing: 2) {
                                Image("RaitingStar")
                                Text(item.rating)
                                    .font(.system(size: 12))
                                Spacer()
                                if item.sale == true {
                                    Text("25%")
                                        .bold()
                                        .foregroundStyle(Color(UIColor(red: 195/255, green: 35/255, blue: 35/255, alpha: 1)))
                                        .font(.system(size: 16))
                                }
                            }
                            .frame(width: secondReader.size.width, height: 16, alignment: .leading)
                            Text(item.description)
                                .frame(width: secondReader.size.width, height: 30, alignment: .leading)
                                .font(.system(size: 12))
                            GeometryReader { readerCountry in
                                HStack {
                                    if item.country == true {
                                        Text("Франция")
                                            .foregroundStyle(.secondary)
                                            .font(.system(size: 12))
                                        Image("France")
                                        
                                    }
                                }
                                .frame(width: secondReader.size.width, alignment: .leading)
                            }
                            .frame(height: 15)
                            
                            if basketIsTapped == false {
                                GeometryReader { basketReader in
                                    HStack() {
                                        VStack(alignment: .leading, spacing: 0) {
                                            GeometryReader { readerOn in
                                            }
                                            HStack(spacing: 3) {
                                                Text("\(item.priceRubles)")
                                                    .font(.system(size: 20))
                                                    .bold()
                                                    .minimumScaleFactor(0.9)
                                                    .scaledToFill()
                                                Text("\(item.priceKopecks)")
                                                    .font(.system(size: 16))
                                                    .bold()
                                                    .minimumScaleFactor(0.9)
                                                    .scaledToFill()
                                                Image("RubPrKg")
                                            }
                                            Text(item.discountedPrice)
                                                .strikethrough()
                                                .foregroundStyle(.secondary)
                                                .font(.system(size: 12))
                                        }
                                        Spacer()
                                        Button(action: {
                                            basketIsTapped.toggle()
                                            quantityOfGoodsInTheBasket += 1
                                        }) {
                                            Image("Basket")
                                                .padding(.top)
                                                .padding(.top)
                                        }
                                    }
                                    
                                }
                                .frame(width: secondReader.size.width, height: 72, alignment: .leading)
                            } else {
                                VStack {
                                    Picker(selection: $pickerSelection, label: Text("")) {
                                        Text("Шт").tag(0)
                                        Text("Кг").tag(1)
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 40)
                                            .frame(width: secondReader.size.width, height: 35)
                                            .foregroundStyle(Color(UIColor(red: 21/255, green: 183/255, blue: 66/255, alpha: 1)))
                                        HStack {
                                            Button(action: {
                                                quantityOfGoodsInTheBasket -= 1
                                                if quantityOfGoodsInTheBasket == 0 {
                                                    basketIsTapped.toggle()
                                                }
                                                
                                            }) {
                                                Image("Minus")
                                                    .frame(width: 36, height: 36)
                                                    .clipShape(Circle())
                                            }
                                            Spacer()
                                            VStack(alignment: .center) {
                                                if pickerSelection == 0 {
                                                    Text("\(quantityOfGoodsInTheBasket) шт")
                                                        .bold()
                                                        .font(.system(size: 16))
                                                        .foregroundStyle(.white)
                                                } else {
                                                    Text("\(quantityOfGoodsInTheBasket) кг")
                                                        .bold()
                                                        .font(.system(size: 16))
                                                        .foregroundStyle(.white)
                                                }
                                                if pickerSelection == 0 {
                                                    Text("\(item.priceRubles)" + "," + "\(item.priceKopecks)" + "₽")
                                                        .font(.system(size: 12))
                                                        .foregroundStyle(.white)
                                                } else {
                                                    Text("\(item.priceRubles)" + "," + "\(item.priceKopecks)" + "₽")
                                                        .font(.system(size: 12))
                                                        .foregroundStyle(.white)
                                                }
                                            }
                                            Spacer()
                                            Button(action: {
                                                quantityOfGoodsInTheBasket += 1
                                            }) {
                                                Image("Plus")
                                                    .frame(width: 36, height: 36)
                                                    .clipShape(Circle())
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .frame(width: reader.size.width * 0.95, height: reader.size.height * 0.52)
                }
                .frame(width: reader.size.width, height: reader.size.height)
                HStack(alignment: .top) {
                    if item.promotion == .blowToPrice {
                        Text("Удар по ценам")
                            .font(.system(size: 10))
                            .frame(width: reader.size.width * 0.5, height: 16)
                            .background(Color(UIColor(red: 252/255, green: 106/255, blue: 111/255, alpha: 0.9)))
                            .clipShape(.rect(topLeadingRadius: 20.0, bottomLeadingRadius: 0.0, bottomTrailingRadius: 6.0, topTrailingRadius: 6.0))
                    } else if item.promotion == .news {
                        Text("Новинки")
                            .font(.system(size: 10))
                            .frame(width: reader.size.width * 0.4, height: 16)
                            .background(Color(UIColor(red: 122/255, green: 121/255, blue: 186/255, alpha: 0.9)))
                            .clipShape(.rect(topLeadingRadius: 20.0, bottomLeadingRadius: 0.0, bottomTrailingRadius: 6.0, topTrailingRadius: 6.0))
                    } else if item.promotion == .priceByCard {
                        Text("Цена по карте")
                            .font(.system(size: 10))
                            .frame(width: reader.size.width * 0.5, height: 16)
                            .background(Color(UIColor(red: 91/255, green: 205/255, blue: 93/255, alpha: 0.9)))
                            .clipShape(.rect(topLeadingRadius: 20.0, bottomLeadingRadius: 0.0, bottomTrailingRadius: 6.0, topTrailingRadius: 6.0))
                    }
                    GeometryReader { thirdReader in
                    }
                }
            }
            VStack() {
                ZStack {
                    RoundedRectangle(cornerRadius: 16.0)
                        .frame(width: reader.size.width * 0.18, height: reader.size.height * 0.25)
                        .foregroundStyle(Color(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)))
                    VStack() {
                        Button(action: {
                        }) {
                            Image("Check")
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: {
                            likeIsTapped.toggle()
                        }) {
                            Image(likeIsTapped == false ? "Like" : "LikeGreen")
                        }
                        .padding(.top)
                    }
                }
            }
            .frame(width: reader.size.width, alignment: .trailing)
        }
        .frame(height: 278)
        .background(.white)
        .clipShape(.rect(cornerRadius: 16.0))
        .shadow(color: .gray, radius: 4)
    }
}

#Preview {
    GridView()
}
