//
//  OrderRowView.swift
//  HuliPizza
//
//  Created by Momin Shoaib on 13/06/2023.
//

import SwiftUI

struct OrderRowView: View {
    @Binding var orders : OrderItem
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline){
                Text(orders.item.name)
                Spacer()
                
            }
            
            HStack {
                Text("\(orders.quantity)")
                Text("@")
                Text(orders.item.price, format : .currency(code : "USD"))
                Spacer()
                Text(orders.extPrice, format: .currency(code: "USD"))
                    .fontWeight(.semibold)
            }
        }
        .padding()
        
        
    }
}

#Preview {
    OrderRowView(orders: .constant(testOrderItem) )
}
