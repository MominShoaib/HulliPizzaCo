//
//  MenuRowView.swift
//  HuliPizza
//
//  Created by Momin Shoaib on 13/06/2023.
//

import SwiftUI

struct MenuRowView: View {
    
    var item : MenuItem
    var body: some View {
        HStack(alignment: .top, spacing: 15){
           // Image(systemName: "\(item).circle.fill").font(.largeTitle)
              //  .padding(.top, 12)
            if let image = UIImage(named: "\(item.id)_sm"){
                Image(uiImage: image)
                    .clipShape(Circle())
                    .padding(.trailing, -25)
                    .padding(.leading, -15)
            } else {
                Image("surfboard_sm")
            }
            VStack(alignment : .leading) {
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.price, format: .currency(code: "USD"))
                }
                RatingsView(rating: item.rating)
            }
            Spacer()
        }
    }
}

#Preview {
    MenuRowView(item: testMenuItem)
}
