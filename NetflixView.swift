import SwiftUI

struct NetflixView: View {
    let items: [MediaItem] = [
        MediaItem(title: "Stranger Things", imageName: "stranger_things"),
        MediaItem(title: "The Crown", imageName: "the_crown"),
        MediaItem(title: "Breaking Bad", imageName: "breaking_bad"),
        MediaItem(title: "Money Heist", imageName: "money_heist"),
        MediaItem(title: "The Witcher", imageName: "the_witcher"),
        MediaItem(title: "Squid Game", imageName: "squid_game"),
        MediaItem(title: "Narcos", imageName: "narcos"),
        MediaItem(title: "Ozark", imageName: "ozarkozark"),
        MediaItem(title: "Black Mirror", imageName: "black_mirror"),
        MediaItem(title: "Mindhunter", imageName: "mindhunter"),
        MediaItem(title: "The Umbrella Academy", imageName:"umbrella_academy"),
        MediaItem(title:"Titanic",imageName:"Titanic")
    ]

    var body: some View {
        VStack {
            Text("Welcome to Netflix")
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding()

            let columns = Array(repeating: GridItem(.flexible()), count: 6)

            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items) { item in
                    VStack {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .frame(width: 250)
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
        .navigationTitle("Netflix")
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

// Preview Provider for NetflixView
struct NetflixView_Previews: PreviewProvider {
    static var previews: some View {
        NetflixView()
            .preferredColorScheme(.dark)
    }
}
