import Foundation
import RealmSwift

class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId?

    @Persisted var _partition: String?

    @Persisted var name: String
    
    @Persisted var availability: AvailabilitySettings?
}
