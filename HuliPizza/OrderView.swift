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
            NavigationStack{
                //identifiable model so no need for id
                //param in for each
                List{ForEach($orders.orderItems){ $order in
                    //Text(orders.item.name)
                    NavigationLink(value:order){
                        OrderRowView(orders: $order)
                            .padding([.bottom,.leading,.trailing],7)
                            .background(.regularMaterial, in : RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                    }.navigationDestination(for: OrderItem.self) { order in
                        OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))
                    }.navigationTitle("Your Order")
                }.onDelete { indexSet in
                    orders.orderItems.remove(atOffsets: indexSet)
                }
                .onMove(perform: { source, destination in
                    orders.orderItems.move(fromOffsets: source, toOffset: destination)
                })
                    
                }
            }
//            .padding(.top, 75)
//            
//            Button("Delete Order"){
//                if !orders.orderItems.isEmpty{orders.removeLast()}
//            }
//            .padding(5)
//            .background(in : RoundedRectangle(cornerRadius: 10))
//            .padding(5)
        }
        .background(Color("Surf"))
        
        
    }
}

#Preview {
    OrderView(orders: OrderModel())
}
