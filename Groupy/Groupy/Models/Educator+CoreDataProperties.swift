//
//  Educator+CoreDataProperties.swift
//  Groupy
//
//  Created by Luan Fazolin on 05/07/23.
//
//

import Foundation
import CoreData


extension Educator {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Educator> {
        return NSFetchRequest<Educator>(entityName: "Educator")
    }

    @NSManaged public var classes: NSSet?

}

// MARK: Generated accessors for classes
extension Educator {

    @objc(addClassesObject:)
    @NSManaged public func addToClasses(_ value: Class)

    @objc(removeClassesObject:)
    @NSManaged public func removeFromClasses(_ value: Class)

    @objc(addClasses:)
    @NSManaged public func addToClasses(_ values: NSSet)

    @objc(removeClasses:)
    @NSManaged public func removeFromClasses(_ values: NSSet)

}
