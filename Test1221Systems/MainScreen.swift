//
//  MainScreen.swift
//  Test1221Systems
//
//  Created by Андрей Бабкин on 09.08.2024.
//

import SwiftUI

struct MainScreen: View {
    @State private var switchButtonState = false
    var body: some View {
        NavigationView {
            if switchButtonState == false {
                GridView()
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                switchButtonState.toggle()
                            }) {
                                Image("NavBarImgGrid")
                            }
                            .padding(.bottom)
                        }
                    }
            } else {
                ListView()
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                switchButtonState.toggle()
                            }) {
                                Image("NavBarImgList")
                            }
                            .padding(.bottom)
                        }
                    }
            }
        }
    }
}

#Preview {
    MainScreen()
}
