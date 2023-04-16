import SwiftUI

struct ContentView: View {
    var body: some View {
        CardView(item: CardItem(imageAsset: "Human"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
