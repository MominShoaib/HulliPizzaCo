//
//  ContentView.swift
//  HuliPizza
//
//  Created by Momin Shoaib on 13/06/2023.
//

import SwiftUI

struct ContentView: View {
    var menu : [MenuItem]
    @StateObject var orders : OrderModel = OrderModel()
    @State private var showOrders = true
    @State private var showGrid = true
    @State private var selectedItem : MenuItem = noMenuItem
    var body: some View {
        VStack {
            
            HeaderView()
                .shadow(radius: 5)
                .environment(\.colorScheme,.light)
            
            //first syntax of button
            //            Button("Switch View"){
            //                showOrders.toggle()
            //            }
            //            .foregroundStyle(.secondary)
            //second syntax :
            StatusBarView(orders: orders, showOrders: $showOrders, showGrid: $showGrid)
            
            if showOrders {
                OrderView(orders: orders)
                    .padding(5)
                    .background(Color("Surf"), in: RoundedRectangle(cornerRadius: 10))
            } else {
                MenuItemView(item: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial, in : RoundedRectangle(cornerRadius: 10))
            }
            
            if showGrid {
                MenuGridView(menu: menu)
            } else {
                MenuView(menu: menu, selectedItem: $selectedItem)
                
            }
            
            
            
            Spacer()
        }
        .padding()
        .background(LinearGradient(colors: [.cyan, Color("Sky"), Color("Surf"), .white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)     //this sets up environment object for each subview
        //instead of chaining the data down the heirarchy, we can simply do this to use within all subviews
        //for headerview, no need to pass the data, just use environment object modifier
    }
}

#Preview {
    ContentView(menu: MenuModel().menu)
}






