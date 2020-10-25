//
//  SettingsView.swift
//  Fructus
//
//  Created by Terry Dengis on 10/24/20.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    GroupBox (label:
                        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                    ) {
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium and calories.  None have cholesterol.  Fruits are a source of many essential nutrients including potassium, dietary fiber, vitamins and much more.")
                                .font(.footnote)
                        }
                    }
                    GroupBox(label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")) {
                        Divider()
                            .padding(.vertical, 4)
                        Text("If you wish, you can restart the application by toggling the switch in this box.  That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(Color(UIColor.tertiarySystemBackground).clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)))
                    }
                    
                    GroupBox ( label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")) {

                        SettingsRowView(name: "Developer", content:"Terry Dengis")
                        SettingsRowView(name: "Designer", content: "Roberts Petras")
                        SettingsRowView(name: "Compatabilty", content: "iOS 14")
                        SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDesintaion: "swiftUImasterclass.com")
                        SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDesintaion: "twitter.com/robertpetras")
                        SettingsRowView(name: "SwiftUI", content:"2.0")
                        SettingsRowView(name: "Version", content:"1.0.0")
                    }
                } // VStack
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                        }
                )
                .padding()
            } // VStack
        } // NavigationView
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.light)
    }
}
