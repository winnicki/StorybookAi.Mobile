import Foundation
import RealmSwift

class CardItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var imageAsset: String
    @Persisted var isSelected: Bool
    
    convenience init(imageAsset: String) {
        self.init()
        self.imageAsset = imageAsset
        self.isSelected = false
    }
}
