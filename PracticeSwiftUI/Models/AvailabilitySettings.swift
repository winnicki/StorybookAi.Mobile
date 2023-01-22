import Foundation
import RealmSwift

class AvailabilitySettings: EmbeddedObject, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId?
    
    @Persisted var isAvailable: Bool
    
    @Persisted var acceptsVideoCalls: Bool
    
    @Persisted var currentTopics: List<Topic>
}
