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
    //CRUDj
    
//    init () {
//        loadFromPersistantState()
//    }

    //access controll. can only be accessed inside of starController.
    private(set) var stars: [Star] = []
    
    
    //navigating to the file path to store data.
    // creating our own URL
    private var persistentFileURL: URL? {
        //iphones file system
        let fileManager = FileManager.default
        //we want to store our documents in a documentDiretory (in iOS)
        //user directory
        //find the first url for document directory or return nil
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        //final pass component
        //coercing it and telling it it's going to be stars.plist
        return documents.appendingPathComponent("stars.plistl")
    }

    //create
    //can call the func without doing anything with the return value. dont always want to use the return value. You don't have to with discarableResult
    //throw away return
    //this is going in table view you. you want to append here
    @discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
        let star = Star(name: name, distance: distance)
        stars.append(star)
        //saving it.
        savetoPersistentStore()
        return star
}

    //CRUD
    //do try catch block
    //Save and load
    //Star -> Data -> Plist
    func savetoPersistentStore() {
        //need a url for a place we can properly save to
        // drop point so you can inspect the url(click hold on number li)
        guard let url = persistentFileURL else { return }
        //encode our star objects so they can be added to a plist file
    do {
        let encoder = PropertyListEncoder()
        //try to encode star objects. If unable, it is going to log the item
        let data = try encoder.encode(stars)
        //write that data to the url to save
        try data.write(to: url)
    } catch {
        print("Error saving stars data: \(error)")
    
    }
    }
        
        func loadFromPersistentStore() {
            // Data in Plist - > Star
            //access file manangel
            let fileManager = FileManager.default
            //make sure its not nil
            guard let url = persistentFileURL,
                // want to make sure the file exist there
                fileManager.fileExists(atPath: url.path) else { return }
        do {
            //contents of url
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            //decoding into an array objects from the data
            stars = try decoder.decode([Star].self, from: data)
            //if we have errors, catch them in the catch block
        } catch {
            print("Error loading stars data: \(error)")
            }
        }
}
