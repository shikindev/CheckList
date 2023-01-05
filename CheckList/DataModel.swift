//
//  DataModel.swift
//  CheckList
//
//  Created by maxshikin on 05.01.2023.
//

import Foundation

class DataModel {
     
    var lists = [Checklist]()
    
    
    init () {
        loadChecklists()
    }
    
    
    //MARK FileSystem
    func documentsDirectory () -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }

    func saveCheckLists() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            try data.write(to:dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print ("Error coding item array \(error.localizedDescription)")
        }
    }

    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode([Checklist].self, from: data)
            } catch {
                print ("Error decoding item array \(error.localizedDescription)")
        }
    }
}
    
}
