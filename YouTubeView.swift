import SwiftUI

struct YouTubeView: View {
    let items: [MediaItem] = [
        MediaItem(title: "Song 1", imageName: "song1"),
        MediaItem(title: "Drama 1", imageName: "drama1"),
        MediaItem(title: "Movie 1", imageName: "movie1"),
        MediaItem(title: "Vlog 1", imageName: "vlog1"),
        MediaItem(title: "Song 2", imageName: "song2"),
        MediaItem(title: "Drama 2", imageName: "drama2"),
        MediaItem(title: "Movie 2", imageName: "movie2"),
        MediaItem(title: "Vlog 2", imageName: "vlog2"),
        MediaItem(title: "Song 3", imageName: "song3"),
        MediaItem(title: "Drama 3", imageName: "drama3"),
        MediaItem(title: "Movie 3", imageName: "movie3"),
        MediaItem(title: "Vlog 3", imageName: "vlog3")
    ]

    var body: some View {
        VStack {
            Text("Welcome to YouTube")
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding()

            let columns = Array(repeating: GridItem(.flexible()), count: 6)

            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items) { item in
                    VStack {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill() // Use scaledToFill to fill the frame
                            .frame(width: 250, height: 250) // Set a fixed width and height
                            .clipped() // Clip any excess parts of the image
                            .cornerRadius(10)

                        Text(item.title)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                    }
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                }
            }
            .padding()

            Spacer()

            CustomBackButton() // Add custom back button at the bottom
        }
        .navigationTitle("YouTube")
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

// Preview Provider for YouTubeView
struct YouTubeView_Previews: PreviewProvider {
    static var previews: some View {
        YouTubeView()
            .preferredColorScheme(.dark)
    }
}
