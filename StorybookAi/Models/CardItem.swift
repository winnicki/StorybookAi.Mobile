import Foundation
import RealmSwift

class CardItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId?

    @Persisted var _partition: String?

    @Persisted var imageAsset: String?

    @Persisted var name: String?
    
    @Persisted var isSelected: Bool
}
