//
//  ColorItemDetailView.swift
//  Transferable-2023
//
//  Created by Owen Hildreth on 3/8/23.
//

import SwiftUI

struct ColorItemDetailView: View {
    @State var colorItem: ColorItem? = nil
    
    @State private var borderColor: Color = .black
    @State private var borderWidth: CGFloat = 1.0
    
    @EnvironmentObject var pastboardController: PasteboardController
    
    var body: some View {
        VStack {
            if let colorItem {
                ColorItemView(colorItem: colorItem)
            } else {
                Text("Drag and Drop a color here!")
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 280, height: 220)
        .background(Color.gray.opacity(0.25))
        .cornerRadius((colorItem != nil) ? 8.0 : 0.0 )
        .border(borderColor, width: (colorItem != nil) ? 0.0 : borderWidth)
        .padding(.trailing)
        .dropDestination(for: ColorItem.self) { items, location in
            //colorItem = items.first
            print(location) 
            return true
        } isTargeted: { inDropArea in
            print("In drop area", inDropArea)
            borderColor = inDropArea ? .accentColor : .black
            borderWidth = inDropArea ? 3.0 : 1.0
        }
        .pasteDestination(for: ColorItem.self, action: paste, validator: validColorItems(for:))
        .contextMenu {
            Button("Paste") {
                let newColorItem = pastboardController.getColorItemFromPasteboard()
                colorItem = newColorItem
            }
        }
        
    }
    
    
    func paste(items: [ColorItem]) {
        guard let item = items.first else {return}
        
        colorItem = item
    }
    
    func validColorItems(for items: [ColorItem]) -> [ColorItem] {
        guard let item = items.first else { return [] }
        return [item]
    }
}

struct ColorItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ColorItemDetailView()
    }
}
