import Foundation
import RealmSwift

class CardItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId?

    @Persisted var _partition: String?

    @Persisted var imageUrl: String?

    @Persisted var name: String?
    
    @Persisted var isSelected: Bool
}
