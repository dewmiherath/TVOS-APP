import SwiftUI

struct CustomBackButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button(action: {
            dismiss() // Dismiss the current view
        }) {
            HStack {
                Image(systemName: "chevron.backward") // Back arrow icon
                Text("Back")
                    .fontWeight(.bold)
            }
            .foregroundColor(.blue) // Customize color as needed
        }
        .padding() // Add padding around the button
    }
}
