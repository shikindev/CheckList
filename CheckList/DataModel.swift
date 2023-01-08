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
                sortChecklist()
            } catch {
                print ("Error decoding item array \(error.localizedDescription)")
        }
    }
   
}
    func sortChecklist() {
        lists.sort{
            list1, list2 in return
            list1.name.localizedStandardCompare(list2.name) == .orderedAscending
        }
    }
    
    class func nextChecklistItemID() -> Int {
        let userDefaults = UserDefaults.standard
        let itemID = userDefaults.integer(forKey: "ChecklistItemID")
        userDefaults.set(itemID + 1, forKey: "ChecklistItemID")
        return itemID
    }
}
