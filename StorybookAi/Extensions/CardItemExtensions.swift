import Foundation

extension CardItem {
    static var stubSingle: CardItem {
        CardItem(value: ["name": "Anime", "imageUrl": "", "isSelected": false])
    }
    static var stubMultiple: [CardItem] {
        [
            CardItem(value: ["name": "Anime", "imageUrl": "", "isSelected": true]),
            CardItem(value: ["name": "Studio Ghibli", "imageUrl": "", "isSelected": false]),
            CardItem(value: ["name": "Pixar", "imageUrl": "", "isSelected": false]),
            CardItem(value: ["name": "Disney", "imageUrl": "", "isSelected": false]),
        ]
    }
}
