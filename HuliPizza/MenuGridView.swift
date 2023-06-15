//
//  MenuGridView.swift
//  HuliPizza
//
//  Created by Momin Shoaib on 15/06/2023.
//

import SwiftUI

struct MenuGridView: View {
    var menu : [MenuItem]
    @State var selectedItem : MenuItem = noMenuItem
    @State var favouriteItem : [Int] = [-1]
    func menu(id: Int)->MenuItem{
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    let columnLayout = Array(repeating: GridItem(spacing : 10), count: 3)
    let rowLayout = Array(repeating: GridItem(spacing : 10), count: 5)
    //for matched geometry, we need unique items and animation already in place
    //we need to also declare a namespace
    //as long as one view in visible, we will see it move from one view to the other
    @Namespace private var nspace
    
    var body: some View {
        VStack{
            LazyVGrid(columns: rowLayout){
                ForEach(favouriteItem.sorted(),id: \.self) { fav in

                    FavoriteTileView(menuItem: menu(id: fav))
                        .matchedGeometryEffect(id: fav, in: nspace)
                        .onLongPressGesture {
                            if let index = favouriteItem.firstIndex(where: {$0 == fav}) {
                                favouriteItem.remove(at: index)
                            }
                        }
                }
            }
            ScrollView {
                LazyVGrid(columns: columnLayout){
                    ForEach(menu) { item in
                        if !favouriteItem.contains(item.id) {
                            MenuItemTileView(menuItem: item)
                                .matchedGeometryEffect(id: item.id, in: nspace)
                                .onTapGesture(count: 2, perform: {
                                    if !favouriteItem.contains(item.id){
                                        favouriteItem.append(item.id)
                                    }
                                    
                                })
                                .onTapGesture { //always put smaller gestures first or else it wont work
                                    selectedItem = item
                                }
                                .onLongPressGesture {
                                    if !favouriteItem.isEmpty {
                                        favouriteItem.removeAll(where: {$0 == item.id})
                                    }
                                }
                        }
                    }
                }
            }.padding()
        }.animation(.easeOut, value: favouriteItem)
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu)
}
