import SwiftUI

struct AppleTVView : View {
    let items:[MediaItem] = [
      MediaItem(title:"The Morning Show" ,imageName :"the_morning_show"),
      MediaItem(title :"Ted Lasso" ,imageName :"ted_lasso"),
      MediaItem(title :"Foundation" ,imageName :"foundation"),
      MediaItem(title :"See" ,imageName :"see"),
      MediaItem(title :"Servant" ,imageName :"servant"),
      MediaItem(title :"For All Mankind" ,imageName :"for_all_mankind"),
      MediaItem(title :"Mythic Quest" ,imageName :"mythic_quest"),
      MediaItem(title :"The Shrink Next Door" ,imageName :"the_shrink_next_door"),
      MediaItem(title :"Pachinko" ,imageName :"pachinko"),
      MediaItem(title :"Invasion" ,imageName :"invasion"),
      MediaItem(title :"The Afterparty" ,imageName :"the_afterparty"),
      MediaItem(title :"Physical" ,imageName :"physical")
   ]

   var body : some View {
       VStack{
           Text("Welcome to Apple TV")
               .font(.largeTitle)
               .foregroundColor(.black)
               .padding()

           let columns = Array(repeating : GridItem(.flexible()), count : 6)

           LazyVGrid(columns : columns, spacing : 20){
               ForEach(items){ item in
                   VStack{
                       Image(item.imageName) // Use valid image names in your assets
                           .resizable()
                           .scaledToFit()
                           .frame(height : 250) // Set the height for the images
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
       .navigationTitle("Apple TV") // Use navigationTitle instead of navigationBarTitle
       .background(Color.white.edgesIgnoringSafeArea(.all))
   }
}

// Preview Provider for AppleTVView
struct AppleTVView_Previews : PreviewProvider {
   static var previews : some View {
       AppleTVView()
           .preferredColorScheme(.light) // Use light mode for preview
   }
}
