//
//  MenuView.swift
//  HuliPizza
//
//  Created by Momin Shoaib on 13/06/2023.
//

import SwiftUI

struct MenuView: View {
    var menu : [MenuItem]
    @Binding var selectedItem : MenuItem
    var body: some View {
        //ScrollView{
        List(MenuCategory.allCases, id: \.self){ category in
            Section {
                ForEach(menu.filter({$0.category == category})){ item in
                   MenuRowView(item: item)
                        .padding(.top,10)
                        .onTapGesture {
                            selectedItem = item
                        }
                }
            } header: {
                Text(category.rawValue)
                    .foregroundStyle(.surf)
            }
        }
    }
}

#Preview {
    MenuView(menu: MenuModel().menu, selectedItem: .constant(testMenuItem))
}
