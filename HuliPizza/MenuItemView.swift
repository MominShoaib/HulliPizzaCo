//
//  MenuItemView.swift
//  HuliPizza
//
//  Created by Momin Shoaib on 13/06/2023.
//

import SwiftUI

struct MenuItemView: View {
    //binding is the links
    //state is where you start
    @State private var addedItem = false
    @Binding var item : MenuItem
    @ObservedObject var orders : OrderModel
    @State var presentAlert = false
    @State private var newOrder = true
    @State private var order = noOrderItem
    
    var body: some View {
        VStack() {
            
            HStack {
                Text(item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                
                if let image = UIImage(named: "\(item.id)_lg"){
                    Image(uiImage: image)
                    //.cornerRadius(10) deprecated
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 13))
                        .padding([.top,.bottom,.trailing], 3)
                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(Angle(degrees: 180))
                }
            }
            .background(LinearGradient(colors: [Color("Surf"), Color("Sky").opacity(0.1)], startPoint: .leading, endPoint: .trailing), in : Capsule())
            .shadow(color: .teal,radius: 15, x: 10 , y: 10 )

            VStack() {
               
                ScrollView {
                    Text(item.description)
                        .font(.custom("Georgia", size: 18, relativeTo : .body))
                    //this makes it conform to dynamic type
                }
                
                Button{
                    orders = OrderItem(id: -99, item: item)
                    presentAlert = true
                } label: {
                    Spacer()
                    Text(item.price, format: .currency(code : "USD")).bold()
                    Image(systemName : addedItem ? "cart.badge.plus" : "cart.fill.badge.plus")
                        .font(.title2)
                    Spacer()
                }
                .disabled(item.id < 0)
                .padding()
                .background(Color("customRed"), in: RoundedRectangle(cornerRadius: 100))
                .foregroundStyle(.white)
                .padding(5)
//                .alert("Buy  a \(item.name)", isPresented: $presentAlert){
//                    Button("No",role: .cancel){
//                        addedItem = false
//                    }
//                    Button("Yes"){
//                        addedItem = true
//                        orders.addOrder(item, quantity: 1)
//                    }
//                    Button("Double it!"){
//                        addedItem = true
//                        orders.addOrder(item, quantity: 2)
//                    }
//                    
//                }
                .sheet(isPresented: $presentAlert){
                    addedItem = true
                }
                content:{
                    OrderDetailView(orderItem: $order, presentSheet: $presentAlert, newOrder: $newOrder)
                }
              
                Spacer()
            }
           
            
                
        }
    }
}

#Preview {
    MenuItemView(item: .constant(testMenuItem), orders: OrderModel())
}
