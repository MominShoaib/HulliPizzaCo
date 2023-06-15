//
//  StatusBarView.swift
//  HuliPizza
//
//  Created by Momin Shoaib on 15/06/2023.
//

import SwiftUI

struct StatusBarView: View {
    @ObservedObject var orders : OrderModel
    @Binding var showOrders : Bool
    @Binding var showGrid : Bool
    
    var body: some View {
        
        HStack {
            Text("\(orders.orderItems.count) orders")
            Spacer()
            Button{
                showOrders.toggle()
            } label: {
                Image(systemName : showOrders ? "cart" : "menucard")
                
            }
            Button{
                showGrid.toggle()
            } label: {
                Image(systemName : showGrid ? "grid" : "list.dash")
                
            }
            Spacer()
            Label{
                Text(orders.orderTotal, format: .currency(code: "USD"))
            }icon: {
                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
            }
            
        }
        .foregroundStyle(.black)
        .font(.title2)
        
        
        
        
    }
}

#Preview {
    StatusBarView(orders: OrderModel(), showOrders : .constant(false), showGrid: .constant(true))
}
