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
        do {
            return try await perform { context in
                let fetchRequest: NSFetchRequest<InstallmentEntity> = InstallmentEntity.fetchRequest()
                let result = try context.fetch(fetchRequest)
                print("fetched \(result)")
                let installments = result.map { $0.asModel }
                return installments
            }
        } catch {
            throw error
        }
    }
    
    func save(_ installment: Installment) async throws {
        try await perform { context in
            let entity = InstallmentEntity(context: context)
            entity.id = installment.id
            entity.name = installment.name
            entity.monthlyPayment = installment.monthlyPayment
            entity.months = Int64(installment.months)
            entity.startingDate = installment.startingDate
            entity.paymentDay = Int16(installment.paymentDay)
            
            do {
                try context.save()
            } catch {
                print("Failed to save installment: \(error)")
                throw error
            }
        }
    }
    
    func delete(_ id: UUID) async throws {
        try await perform { context in
            let fetchRequest: NSFetchRequest<InstallmentEntity> = InstallmentEntity.fetchRequest()
            print(id.uuidString)
            fetchRequest.predicate = NSPredicate(format: "id == %@", id.uuidString)

            do {
                let result = try context.fetch(fetchRequest)
                if let entityToDelete = result.first {
                    context.delete(entityToDelete)
                    try context.save()
                }
            } catch {
                print("Failed to delete installment: \(error)")
                throw error
            }
        }
    }

    private func perform<T>(action: @escaping (NSManagedObjectContext) throws -> T) async throws -> T {
        let context = self.context
        do {
            return try await withCheckedThrowingContinuation { continuation in
                context.perform {
                    do {
                        let result = try action(context)
                        continuation.resume(returning: result)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                }
            }
        } catch {
            throw error
        }
    }
}

extension InstallmentEntity {
    var asModel: Installment {
        .init(
            id: self.id!,
            name: self.name!,
            monthlyPayment: self.monthlyPayment,
            months: Int(self.months),
            startingDate: self.startingDate!,
            paymentDay: Int(self.paymentDay)
        )
    }
}
