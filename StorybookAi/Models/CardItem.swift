import Foundation
import RealmSwift

class CardItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId?
    @Persisted var _partition: String?
    @Persisted var imageAsset: String?
    @Persisted var name: String?
    
    @Persisted private var _isSelected: Bool

    var isSelected: Bool {
        get {
            return _isSelected
        }
        set {
            realm?.beginWrite()
            _isSelected = newValue
            try? realm?.commitWrite()
        }
    }
}
