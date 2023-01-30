import Foundation
import RealmSwift

class Story: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var Pages: List<Story_Pages>

    @Persisted var Title: String?
    
    @Persisted var Cover: String?

    @Persisted var _partition: String = ""
}
