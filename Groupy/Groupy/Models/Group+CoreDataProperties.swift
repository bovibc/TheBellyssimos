//
//  Group+CoreDataProperties.swift
//  Groupy
//
//  Created by Luan Fazolin on 04/07/23.
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
    @NSManaged public var members: Student?

}

extension Group : Identifiable {

}
