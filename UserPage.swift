import SwiftUI

struct UserPage: View {
    var body: some View {
        NavigationView { // Wrap the entire view in a NavigationView
            HStack { // Main horizontal stack
                VStack { // Left side for user account details
                    Text("Account")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.top, 40) // Increased space at the top

                    // Box for user account details
                    ZStack {
                        RoundedRectangle(cornerRadius: 15) // Box with rounded corners
                            .fill(Color.black.opacity(0.8)) // Background color of the box
                            .frame(width: 400, height: 500) // Size of the box

                        VStack { // Content inside the box
                            // Circular user image
                            Image("user_profile") // Replace with your image name
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150) // Size of the image
                                .clipShape(Circle()) // Make the image circular
                                .overlay(Circle().stroke(Color.white, lineWidth: 5)) // Optional border

                            Text("Dewmi Herath") // Display only the username
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(.top, 10) // Space above username

                            // Adding date and weather information
                            VStack(spacing: 10) { // Increased spacing between elements
                                Text(formattedTime())
                                    .fontWeight(.bold) // Make time bold
                                    .foregroundColor(.gray)
                                Text(formattedDate())
                                    .foregroundColor(.gray)

                                HStack {
                                    Image(systemName: "cloud.fill") // Cloud icon from SF Symbols
                                        .foregroundColor(.white) // Change color as needed
                                    Text(formattedWeather())
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.top, 10) // Add some space above the date and weather

                            NotificationBar() // Add notification bar below weather information

                            Spacer() // Pushes content to the top inside the box
                        }
                        .padding() // Padding inside the box
                    }

                    Spacer() // Pushes content to the top of the main VStack
                }
                .frame(maxWidth: 300) // Fixed width for user account details
                
                VStack {
                    CarouselView() // Carousel with images
                    
                    Spacer() // Pushes buttons to the bottom
                    
                    HStack { // Bottom buttons with NavigationLinks
                        NavigationLink(destination: NetflixView()) {
                            Text("Netflix")
                                .font(.headline)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }

                        NavigationLink(destination: AppleTVView()) {
                            Text("Apple TV")
                                .font(.headline)
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }

                        NavigationLink(destination: YouTubeView()) {
                            Text("YouTube")
                                .font(.headline)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }

                        NavigationLink(destination: DisneyView()) {
                            Text("Disney+")
                                .font(.headline)
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding() // Padding around the button row
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all)) // Background color for the entire view
        }
    }

    private func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: Date())
    }

    private func formattedTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a" // Format to include AM/PM
        return formatter.string(from: Date())
    }

    private func formattedWeather() -> String {
        return "25°C"
    }
}

// NotificationBar View remains unchanged.
struct NotificationBar: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Notifications")
                .fontWeight(.bold)
                .foregroundColor(.white)

            ForEach(notificationMessages, id: \.self) { message in
                HStack {
                    Image(systemName: "bell.fill")
                        .foregroundColor(.yellow)
                    Text(message)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
            }
        }
    }

    private var notificationMessages: [String] {
        return [
            "New message from Alice",
            "Your order has been shipped",
            "Reminder: Meeting at 3 PM",
            "Update available for your app"
        ]
    }
}

// CarouselView with Images
struct CarouselView: View {
    let images = ["image1"] // Replace with your actual image names

    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image) 
                  // Use valid image names in your assets
                    .resizable()
                    .padding(.top, 300)
                    .scaledToFill()
                    .frame(height: 900) // Set height for carousel images
                    .clipped()          // Clip excess parts of images
            }
        }
        .tabViewStyle(PageTabViewStyle()) // Use page style for swiping through images
        .frame(height: 800)               // Set height for Carousel view container
    }
}

struct UserPage_Previews: PreviewProvider {
    static var previews: some View {
        UserPage()
    }
}
