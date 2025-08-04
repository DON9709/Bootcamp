//
//  BookEntity+CoreDataProperties.swift
//  BookFinder
//
//  Created by 이돈혁 on 8/4/25.
//


import Foundation
import CoreData

extension BookEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookEntity> {
        return NSFetchRequest<BookEntity>(entityName: "BookEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var authors: String?
    @NSManaged public var publisher: String?
    @NSManaged public var price: Int64
    @NSManaged public var thumbnail: String?
    @NSManaged public var contents: String?
}

extension BookEntity: Identifiable {}
