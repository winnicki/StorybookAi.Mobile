import Foundation

extension CardItem {
    static var stubSingle: CardItem {
        CardItem(value: ["name": "Studio Ghibli", "imageAsset": "Ghibli", "isSelected": true])
    }
    static var stubMultiple: [CardItem] {
        [
            CardItem(value: ["name": "Anime", "imageAsset": "Anime", "isSelected": true]),
            CardItem(value: ["name": "Studio Ghibli", "imageAsset": "Ghibli", "isSelected": false]),
            CardItem(value: ["name": "Pixar", "imageAsset": "Pixar", "isSelected": false]),
            CardItem(value: ["name": "Disney", "imageAsset": "Disney", "isSelected": false]),
        ]
    }
}
