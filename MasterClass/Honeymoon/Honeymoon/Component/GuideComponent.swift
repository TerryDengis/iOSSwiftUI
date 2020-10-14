//
//  GuideComponent.swift
//  Honeymoon
//
//  Created by Terry Dengis on 10/12/20.
//

import SwiftUI

struct GuideComponent: View {
    // MARK: - Properties
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.pink)
            VStack (alignment:.leading, spacing: 4) {
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer ()
                    Text(subtitle)
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                }
                Divider()
                    .padding(.bottom, 4)
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "Title", subtitle: "Swipe Right", description: "This is a placeholder sentence.  This is a placeholder sentence.  This is a placeholder sentence.", icon: "heart.circle")
            .previewLayout(.sizeThatFits)
    }
}
