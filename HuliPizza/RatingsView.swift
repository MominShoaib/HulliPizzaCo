//
//  RatingsView.swift
//  HuliPizza
//
//  Created by Momin Shoaib on 13/06/2023.
//

import SwiftUI

struct RatingsView: View {
    var rating : Int
    var body: some View {
        HStack {
            ForEach(1...6, id: \.self){ ratings in
                rating < ratings ? Image(systemName: "circle") : Image(systemName: "fork.knife.circle.fill")
            }
        }
    }
}

#Preview {
    RatingsView(rating: 5)
}
