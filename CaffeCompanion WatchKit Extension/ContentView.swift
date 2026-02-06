import SwiftUI

struct ContentView: View {
    @State var date = Date.now
    @Environment(\.locale) var locale
    
    var dateString: AttributedString {
        var str = date.formatted(.dateTime
                                    .locale(locale)
                                    .minute()
                                    .hour()
                                    .weekday()
                                    .attributed)
        
        let weekday = AttributeContainer
            .dateField(.weekday)
        
        let color = AttributeContainer
            .foregroundColor(.orange)
        
        str.replaceAttributes(weekday, with: color)

        return str
    }

    var body: some View {
        VStack {
            Text("Next free coffee")
            Text(dateString).font(.title2)
        }
        .multilineTextAlignment(.center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, Locale(identifier: "en_US"))
        ContentView()
            .environment(\.locale, Locale(identifier: "he_IL"))
        ContentView()
            .environment(\.locale, Locale(identifier: "es_ES"))
    }
}
