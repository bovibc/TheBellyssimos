//
//  User+CoreDataProperties.swift
//  Groupy
//
//  Created by Luan Fazolin on 04/07/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstTime: Bool
    @NSManaged public var id: Int64
    @NSManaged public var loggedIn: Bool
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var photo: String?
    @NSManaged public var role: String?
    @NSManaged public var username: String?

}

extension User : Identifiable {

}
