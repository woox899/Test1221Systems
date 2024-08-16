//
//  ContentView.swift
//  Test1221Systems
//
//  Created by Андрей Бабкин on 07.08.2024.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = ItemViewModel()
    var body: some View {
        List(viewModel.itemsList) { item in
            ForEach(viewModel.itemsList)  { item in
                ListItemShopView(item: item)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
}

struct ListItemShopView: View {
    var item: Item
    @State private var quantityOfGoodsInTheBasket = 0
    @State private var pickerSelection = 0
    @State private var basketIsTapped: Bool = false
    @State private var likeIsTapped: Bool = false
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image(item.image)
                    HStack(alignment: .top) {
                        if item.promotion == .blowToPrice {
                            Text("Удар по ценам")
                                .font(.system(size: 10))
                                .frame(width: 100, height: 16)
                                .background(Color(UIColor(red: 252/255, green: 106/255, blue: 111/255, alpha: 0.9)))
                                .clipShape(.rect(topLeadingRadius: 20.0, bottomLeadingRadius: 0.0, bottomTrailingRadius: 6.0, topTrailingRadius: 6.0))
                        } else if item.promotion == .news {
                            Text("Новинки")
                                .font(.system(size: 10))
                                .frame(width: 70, height: 16)
                                .background(Color(UIColor(red: 122/255, green: 121/255, blue: 186/255, alpha: 0.9)))
                                .clipShape(.rect(topLeadingRadius: 20.0, bottomLeadingRadius: 0.0, bottomTrailingRadius: 6.0, topTrailingRadius: 6.0))
                        } else if item.promotion == .priceByCard {
                            Text("Цена по карте")
                                .font(.system(size: 10))
                                .frame(width: 100, height: 16)
                                .background(Color(UIColor(red: 91/255, green: 205/255, blue: 93/255, alpha: 0.9)))
                                .clipShape(.rect(topLeadingRadius: 20.0, bottomLeadingRadius: 0.0, bottomTrailingRadius: 6.0, topTrailingRadius: 6.0))
                        }
                        GeometryReader { thirdReader in
                        }
                    }
                    if item.sale == true {
                        
                        HStack(alignment: .bottom) {
                            Text("25%")
                                .bold()
                                .foregroundStyle(Color(UIColor(red: 195/255, green: 35/255, blue: 35/255, alpha: 1)))
                                .font(.system(size: 16))
                                .padding(.top, 120)
                                .padding(.leading, 100)
                        }
                    }
                }
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Image("RaitingStar")
                                Text(item.rating)
                                    .font(.system(size: 12))
                                Image("Line")
                                Text(item.numberOfReviews)
                                    .font(.system(size: 12))
                            }
                            
                            
                            HStack {
                                Text(item.description)
                                    .font(.system(size: 12))
                            }
                            HStack {
                                if item.country == true {
                                    Text("Франция")
                                        .foregroundStyle(.secondary)
                                        .font(.system(size: 12))
                                    Image("France")
                                }
                            }
                        }
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 32, height: 64)
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
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    HStack() {
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
                                    })
                                    {
                                        Image("Basket")
                                            .padding(.top)
                                            .padding(.top)
                                    } .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .frame(height: 72)
                            
                        } else {
                            VStack(spacing: 5) {
                                Picker(selection: $pickerSelection, label: Text("Picker")) {
                                    Text("Шт").tag(0)
                                    Text("Кг").tag(1)
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                ZStack {
                                    RoundedRectangle(cornerRadius: 40)
                                        .frame(height: 33)
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
                                        .buttonStyle(PlainButtonStyle())
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
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                        }
                    }
                }
            }
            RoundedRectangle(cornerRadius: 1)
                .frame(width: UIScreen.main.bounds.width, height: 2)
                .foregroundStyle(Color(UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1)))
        }
        .frame(width: UIScreen.main.bounds.width * 0.9)
    }
}

#Preview {
    ListView()
}
