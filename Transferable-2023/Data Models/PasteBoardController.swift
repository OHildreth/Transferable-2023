//
//  PasteBoardController.swift
//  Transferable-2023
//
//  Created by Owen Hildreth on 3/10/23.
//

import Foundation
import AppKit

extension ColorItem {
    func pasteString() -> String {
        var output = "Color Item: \(name)"
        output += "\nred: \(red)"
        output += "\ngreen: \(green)"
        output += "\nblue: \(blue)"
        
        return output
    }
}

extension NSPasteboard.PasteboardType {
    static var colorItem = NSPasteboard.PasteboardType("edu.HRG.colorItem")
}


class PasteboardController: ObservableObject {
    private var appPasteboard: NSPasteboard
    
    private var generalPasteboard: NSPasteboard {
        return NSPasteboard.general
    }
    
    init() {
        appPasteboard = NSPasteboard(name: .customAppPasteboard)
        appPasteboard.addTypes([.colorItem], owner: nil)
        appPasteboard.clearContents()
    }
    
    func pushColorItemToPasteboard(_ colorItem: ColorItem) {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(colorItem) else {return}
        
        appPasteboard.clearContents()
        appPasteboard.setData(data, forType: .colorItem)
        
        
        generalPasteboard.clearContents()
        generalPasteboard.setString(colorItem.pasteString(), forType: .string)
    }
    
    func getColorItemFromPasteboard() -> ColorItem? {
        guard let data = appPasteboard.data(forType: .colorItem) else {return nil}
        
        let decoder = JSONDecoder()
        
        let pastedColorItem = try? decoder.decode(ColorItem.self, from: data)
        
        return pastedColorItem
    }
}


extension NSPasteboard.Name {
    static let customAppPasteboard = NSPasteboard.Name( "edu.HRG.Transferable-2023")
}
