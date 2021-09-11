//
//  Person+CoreDataProperties.swift
//  CoreDataTutorial
//
//  Created by Do Yi Lee on 2021/09/11.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var age: Int64

}

extension Person : Identifiable {

}
