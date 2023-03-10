//
//  Transferable_2023App.swift
//  Transferable-2023
//
//  Created by Owen Hildreth on 3/8/23.
//

import SwiftUI

@main
struct Transferable_2023App: App {
    
    @StateObject var pasteboardController = PasteboardController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pasteboardController)
        }
    }
}
