import Foundation

extension CardItem {
    static var stubSingle: CardItem {
        CardItem(value: ["name": "Studio Ghibli", "imageAsset": "Ghibli", "isSelected": false] as [String : Any])
    }
    static var stubMultipleArtStyleItems: [CardItem] {
        [
            CardItem(value: ["name": "Anime", "imageAsset": "Anime", "isSelected": false] as [String : Any]),
            CardItem(value: ["name": "Studio Ghibli", "imageAsset": "Ghibli", "isSelected": false] as [String : Any]),
            CardItem(value: ["name": "Pixar", "imageAsset": "Pixar", "isSelected": false] as [String : Any]),
            CardItem(value: ["name": "Disney", "imageAsset": "Disney", "isSelected": false] as [String : Any]),
        ]
    }
    
    static var stubMultipleCharacterStyleItems: [CardItem] {
        [
            CardItem(value: ["name": "Dog", "imageAsset": "Dog", "isSelected": false] as [String : Any]),
            CardItem(value: ["name": "Human", "imageAsset": "Human", "isSelected": false] as [String : Any]),
            CardItem(value: ["name": "Turtle", "imageAsset": "Turtle", "isSelected": false] as [String : Any]),
        ]
    }
    
    static var stubMultipleLocationItems: [CardItem] {
        [
            CardItem(value: ["name": "City", "imageAsset": "City", "isSelected": false] as [String : Any]),
            CardItem(value: ["name": "Jungle", "imageAsset": "Jungle", "isSelected": false] as [String : Any]),
            CardItem(value: ["name": "Space", "imageAsset": "Space", "isSelected": false] as [String : Any]),
        ]
    }
}
