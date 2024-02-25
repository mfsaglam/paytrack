//
//  Installment+CoreDataProperties.swift
//  
//
//  Created by Fatih Sağlam on 4.02.2024.
//
//

import Foundation
import CoreData


extension Installment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Installment> {
        return NSFetchRequest<Installment>(entityName: "Installment")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var monthlyPayment: Double
    @NSManaged public var months: Int64
    @NSManaged public var startingDate: Date?
    @NSManaged public var paymentDay: Int16

}
