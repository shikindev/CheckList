//
//  Checklist.swift
//  CheckList
//
//  Created by maxshikin on 04.01.2023.
//

import UIKit
import Foundation

class Checklist: NSObject, Codable {
    var name: String
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
