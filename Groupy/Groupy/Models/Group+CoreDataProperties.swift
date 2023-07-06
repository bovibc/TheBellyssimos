//
//  Group+CoreDataProperties.swift
//  Groupy
//
//  Created by Luan Fazolin on 05/07/23.
//
//

import Foundation
import CoreData


extension Group {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Group> {
        return NSFetchRequest<Group>(entityName: "Group")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var members: NSSet?

}

// MARK: Generated accessors for members
extension Group {

    @objc(addMembersObject:)
    @NSManaged public func addToMembers(_ value: Student)

    @objc(removeMembersObject:)
    @NSManaged public func removeFromMembers(_ value: Student)

    @objc(addMembers:)
    @NSManaged public func addToMembers(_ values: NSSet)

    @objc(removeMembers:)
    @NSManaged public func removeFromMembers(_ values: NSSet)

}

extension Group : Identifiable {

}
