//
//  ContentView.swift
//  Transferable-2023
//
//  Created by Owen Hildreth on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var colors = ColorItemsViewModel()
    
    var body: some View {
        HStack {
            ColorItemsListView(colorItemsViewModel: colors)
            Divider()
            ColorItemDetailView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
