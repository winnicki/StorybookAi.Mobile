import Foundation
import RealmSwift

class CardItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId?
    @Persisted var _partition: String
    @Persisted var imageAsset: String
    @Persisted var name: String
    @Persisted var isSelected: Bool
    
    convenience init(imageAsset: String) {
        self.init()
        self.imageAsset = "Human"
        self.isSelected = false
        self.name = "Test"
    }
}

