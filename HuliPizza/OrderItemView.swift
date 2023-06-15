//
//  OrderItemView.swift
//  HuliPizza
//
//  Created by Momin Shoaib on 15/06/2023.
//

import SwiftUI

struct OrderItemView: View {
    //binding :  link , state :  starting point
    @Binding var orderItem : OrderItem
    @State private var quantity = 1
    @State private var doubleIngredient = false
    @State var pizzaCrust : PizzaCrust  //for dependency injection we remove private
    @State private var name  = ""
    @State private var comments = ""
    
    init(orderItem : Binding<OrderItem>){
        self._orderItem = orderItem //underscore needed for storing into binded objects
        self.pizzaCrust = orderItem.item.crust.wrappedValue     //wrapped value for storing into state values from values within a binding variable
    }
    
    var body: some View {
        VStack{
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
            Toggle(isOn: $doubleIngredient, label: {
                Text("Double Ingredients?" + (doubleIngredient ? " Yes" : " No"))
            })
            Stepper(value: $quantity, in: 1...10){
                Text("\(quantity) " + (quantity > 1 ? "Pizzas" : "Pizza"))
            }
            Picker(selection: $pizzaCrust) {
                ForEach(PizzaCrust.allCases, id: \.self){ crust in   //we need id here as pizzacrust doesnt conform to identifiable protocol
                    Text(crust.rawValue).tag(crust)
                    
                }
            } label: {
                Text("Pizza Crust")
            }
            .pickerStyle(.menu)
            .padding(.trailing, 274)
            
            VStack {
                Text("Comments")
                TextEditor(text: $comments)
            }
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .shadow(radius: 1)
            Spacer()

            
            
        }
        .padding()
    }
}

#Preview {
    OrderItemView(orderItem: .constant(testOrderItem))
}
