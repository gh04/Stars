//
//  StarController.swift
//  Stars
//
//  Created by Gerardo Hernandez on 12/5/19.
//  Copyright © 2019 Gerardo Hernandez. All rights reserved.
//

import Foundation
//source of truth for the app
class StarController {
    
    
    init () {
        loadFromPersistentStore()
    }
    private(set) var stars: [Star] = []
    //CRUD
    
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("stars.plist")
    }
    //create
    //YOu can call the func without doing anything with the return value. dont always want to use the return value. You don't have to wiht discarbleResult
    //throw away return
    @discarbleResult func createStar(named name: String, withDistance distance: Double) -> Star
    let star = Star(name: name, distance: distance)
    stars.append(star)
    savetoPersistentStore()
    return star
}


func saveToPeristentFileURL() {
    guard let url = persistentFileURL else { return }
    
    do {
        let encoder = PropertyListEncoder()
        let data = try encoder.encode(stars)
        try data.write(to: url)
    } catch {
        print("Error saving stars data: \(error)")
    }
 
    func loadFromPersistentStore() {
        let fileManager = FilerManager.defualt
        gaurd let url = saveToPeristentFileURL,
        fileManager.fileExists(atPath: url.path) else { return }
 
        do {
            let data = try Data(contentOf: url)
            let decoder = PropertyListEncoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("Error Loading stars data: \(error)")
        }
}
