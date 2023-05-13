import Foundation

extension CardItem {
    static var stubSingle: CardItem {
        CardItem(value: ["name": "Studio Ghibli", "imageAsset": "Ghibli", "isSelected": true] as [String : Any])
    }
    static var stubMultiple: [CardItem] {
        [
            CardItem(value: ["name": "Anime", "imageAsset": "Anime", "isSelected": true] as [String : Any]),
            CardItem(value: ["name": "Studio Ghibli", "imageAsset": "Ghibli", "isSelected": false] as [String : Any]),
            CardItem(value: ["name": "Pixar", "imageAsset": "Pixar", "isSelected": false] as [String : Any]),
            CardItem(value: ["name": "Disney", "imageAsset": "Disney", "isSelected": false] as [String : Any]),
        ]
    }
}
