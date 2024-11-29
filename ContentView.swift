import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView { // Wrap content in NavigationView
            VStack {
                Text("Welcome to My tvOS App!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                NavigationLink(destination: UserPage()) { // Use NavigationLink for navigation
                    Text("Get Started")
                        .font(.title)
                        .padding()
                        .background(Color.red) // Set button background color to red
                        .foregroundColor(.white) // Set text color to white
                        .cornerRadius(10) // Rounded corners
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black) // Background color for the entire view
            .edgesIgnoringSafeArea(.all) // Makes the background cover the entire screen
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
