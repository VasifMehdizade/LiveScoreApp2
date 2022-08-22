//
//  List+CoreDataProperties.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 10.08.22.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var country: String?

}

extension List : Identifiable {

}
