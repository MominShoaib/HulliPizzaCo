//
//  HeaderView.swift
//  HuliPizza
//
//  Created by Momin Shoaib on 13/06/2023.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orders : OrderModel
    @Environment(\.verticalSizeClass) var vSizeClass : UserInterfaceSizeClass? //environement variables from system
    var body: some View {
        VStack {
            if (vSizeClass ?? .regular) != .compact {
                ZStack(alignment : .bottomTrailing) {
                    Image("surfBanner")
                        .resizable() //resizable needed for size change
                        .scaledToFit()
                    Text("Huli Pizza Co")
                        .font(.custom("Georgia", size: 30, relativeTo: .largeTitle))
                        .foregroundStyle(.regularMaterial)
                        .fontWeight(.semibold)
                        .shadow(color: .black, radius: 10, x: 5, y: 5)
                    
                    
                }
            } else {
                HStack(alignment : .bottom){
                    Image("surfBanner")
                        .resizable() //resizable needed for size change
                        .scaledToFit()
                    Text("Huli Pizza Co")
                        .font(.custom("Georgia", size: 30, relativeTo: .largeTitle))
                        .foregroundStyle(Color("Surf"))
                        .fontWeight(.heavy)
                }
            }
            
        }
        .backgroundStyle(.ultraThinMaterial)
        
    }
}

#Preview {
    HeaderView().environmentObject(OrderModel())
}
