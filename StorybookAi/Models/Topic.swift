import Foundation
import RealmSwift

class Topic: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId?

    @Persisted var _partition: String?

    @Persisted var emoji: String?

    @Persisted var name: String?

    @Persisted var subtopics: List<String>
    
    @Persisted var color: String
    
    @Persisted var avatar: String
}
