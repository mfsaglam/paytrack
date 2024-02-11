//
//  CoreDataInstallmentStore.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 4.02.2024.
//

import InstallmentCalculator
import CoreData

class CoreDataInstallmentStore: InstallmentStore {
    let persistentContainer: NSPersistentContainer
    private let context: NSManagedObjectContext
    
    init() {
        self.persistentContainer = NSPersistentContainer(name: "Installment")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        self.context = self.persistentContainer.newBackgroundContext()
    }
    
    func load() async throws -> [Installment] {
        []
    }
    
    func save(_ installment: Installment) async throws {
        
    }
    
    func delete(_ installment: Installment) async throws {
        
    }

    private func perform(action: @escaping (NSManagedObjectContext) -> Void) {
        let context = self.context
        context.perform { action(context) }
    }
}
