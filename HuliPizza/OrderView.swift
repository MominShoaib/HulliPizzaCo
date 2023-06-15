//
//  OrderView.swift
//  HuliPizza
//
//  Created by Momin Shoaib on 13/06/2023.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orders : OrderModel
    
    var body: some View {
        VStack {
            ZStack(alignment : .top){   //in zstack.first item written is the bottom most layer
                ScrollView{
                    //identifiable model so no need for id
                    //param in for each
                    ForEach($orders.orderItems){ orders in
                        //Text(orders.item.name)
                        OrderRowView(orders: orders)
                            .padding([.bottom,.leading,.trailing],7)
                            .background(.regularMaterial, in : RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                    }
                }
                .padding(.top, 75)
                HStack{
                    Spacer()
                    Text("Order Pizza")
                        .font(.title)
                        .fontWeight(.medium)
                    Spacer()
                   
         
                    
                }
                .background(.ultraThinMaterial)
                .padding()
            }
            .padding()
            Button("Delete Order"){
                if !orders.orderItems.isEmpty{orders.removeLast()}
            }
            .padding(5)
            .background(in : RoundedRectangle(cornerRadius: 10))
            .padding(5)
        }
        .background(Color("Surf"))

        
    }
}

#Preview {
    OrderView(orders: OrderModel())
}
