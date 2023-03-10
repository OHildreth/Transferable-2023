//
//  ColorItemsListView.swift
//  Transferable-2023
//
//  Created by Owen Hildreth on 3/8/23.
//

import SwiftUI

struct ColorItemsListView: View {
    
    @ObservedObject var colorItemsViewModel: ColorItemsViewModel
    
    @EnvironmentObject var pasteboardController: PasteboardController
    
    var body: some View {
        List{
            ForEach(colorItemsViewModel.items) { nextColor in
                ColorItemView(colorItem: nextColor)
                    //.copyable([nextColor])
                    .contextMenu {
                        Button("Copy") {
                            pasteboardController.pushColorItemToPasteboard(nextColor)
                            print("Copying")
                        }
                    }
            }
        }
        .frame(width: 250)
        .frame(maxHeight: 750)
        .padding(.leading)
    }
}

struct ColorItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        ColorItemsListView(colorItemsViewModel: ColorItemsViewModel())
    }
}
