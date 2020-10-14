//
//  FooterView.swift
//  Honeymoon
//
//  Created by Terry Dengis on 10/12/20.
//

import SwiftUI

struct FooterView: View {
    // MARK: - Properties
    @Binding var showBookingAlert: Bool
    let haptics = UINotificationFeedbackGenerator()
    
    var body: some View {

        HStack {
            Button(action: {
                //
            }) {
                Image(systemName: "xmark.circle")
                    .font(.system(size: 42, weight: .regular))
            }
            .accentColor(.primary)
            Spacer()
            Button(action: {
                playSound("sound-click", type: "mp3")
                haptics.notificationOccurred(.success)
                showBookingAlert.toggle()
            }) {
                Text("Book Destination")
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 12)
                    .accentColor(.pink)
                    .background(
                        Capsule ()
                            .stroke(Color.pink, lineWidth: 2)
                    )
            }
            .accentColor(.primary)
            Spacer ()
            Button(action: {
                //
            }) {
                Image(systemName: "heart.circle")
                    .font(.system(size: 42, weight: .regular))
            }
            .accentColor(.primary)
        } // HStack
        .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(showBookingAlert: .constant(false))
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
