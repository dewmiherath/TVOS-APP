import SwiftUI

struct DisneyView: View {
    // Sample data for Disney content
    let items: [MediaItem] = [
        MediaItem(title: "The Lion King", imageName: "the_lion_king"),
        MediaItem(title: "Frozen", imageName: "frozen"),
        MediaItem(title: "Toy Story", imageName: "toy_story"),
        MediaItem(title: "Aladdin", imageName: "aladdin"),
        MediaItem(title: "Moana", imageName: "moana"),
        MediaItem(title: "Finding Nemo", imageName: "finding_nemo"),
        MediaItem(title: "Zootopia", imageName: "zootopia"),
        MediaItem(title: "Coco", imageName: "coco"),
        MediaItem(title: "Mulan", imageName: "mulan"),
        MediaItem(title: "The Little Mermaid", imageName: "the_little_mermaid"),
        MediaItem(title: "Ratatouille", imageName: "ratatouille"),
        MediaItem(title: "Inside Out", imageName: "inside_out")
    ]

    var body: some View {
        VStack {
            Text("Welcome to Disney+")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()

            // Create a grid layout
            let columns = Array(repeating: GridItem(.flexible()), count: 6)

            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items) { item in
                    VStack {
                        Image(item.imageName) // Ensure valid image names are used
                            .resizable()
                            .scaledToFill() // Fill the frame while maintaining aspect ratio
                            .frame(width: 250, height: 250) // Set fixed width and height
                            .clipped() // Clip any excess parts of the image
                            .cornerRadius(10)

                        Text(item.title)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .lineLimit(1) // Limit to one line
                    }
                    .padding()
                    .background(Color.white.opacity(0.7)) // Background for the item
                    .cornerRadius(10)
                }
            }
            .padding() // Padding around the grid

            Spacer()

            CustomBackButton() // Add custom back button at the bottom
        }
        .navigationTitle("Disney+") // Use navigationTitle instead of navigationBarTitle
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

// Preview Provider for DisneyView
struct DisneyView_Previews: PreviewProvider {
    static var previews: some View {
        DisneyView()
            .preferredColorScheme(.light) // Use light mode for preview
    }
}
