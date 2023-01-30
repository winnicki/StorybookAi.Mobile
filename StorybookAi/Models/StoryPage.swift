import Foundation
import RealmSwift

class Story_Pages: EmbeddedObject {
    @Persisted var Number: Int?
    @Persisted var Paragraph: String?
    @Persisted var ImageUrl: String?
}
