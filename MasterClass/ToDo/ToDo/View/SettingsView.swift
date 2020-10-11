//
//  SettingsView.swift
//  ToDo
//
//  Created by Terry Dengis on 10/10/20.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var iconSettings: IconNames
    
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 0) {
                // Mark: - Form
                Form {
                    // MARK: - Section 1
                    Section(header: Text("Choose the app icon")) {
                        Picker(selection: $iconSettings.currentIndex, label:
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .strokeBorder(Color.primary, lineWidth: 2)
                                    Image(systemName: "paintbrush")
                                        .font(.system(size: 28, weight: .regular, design: .default))
                                        .foregroundColor(.primary)
                                }
                                .frame(width: 44, height: 44)
                                Text("App Icons")
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                            }
                        ) {
                            ForEach(0..<iconSettings.iconNames.count) { index in
                                HStack {
                                    Image(uiImage: UIImage(named: iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:44, height:44)
                                        .cornerRadius(8)
                                    Spacer()
                                        .frame(width:8)
                                    Text(iconSettings.iconNames[index] ?? "Blue")
                                        .frame(alignment: .leading)
                                }
                            }
                        }
                        .onReceive([self.iconSettings.currentIndex].publisher.first()) { (value) in
                            let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                            if index != value {
                                UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { error in
                                    if let error = error {
                                        print(error.localizedDescription)
                                    } else {
                                        print("Success! You have changed the app icon.")
                                    }
                                }
                            }
                        }
                    }
                    .textCase(.none)
                    .padding(.vertical, 3)
                    
                    // MARK: - Section 2
                    Section (header:
                        HStack {
                            Text("App Theme")
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width:20, height:20)
                                .foregroundColor(themes[theme.themeSettings].themeColor)
                        }
                    ) {
                        List {
                            ForEach (themes, id:\.id) { item in
                                Button (action: {
                                    theme.themeSettings = item.id
                                    UserDefaults.standard.set(theme.themeSettings, forKey:"Theme")
                                }) {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(item.themeColor)
                                        Text (item.themeName)
                                    }
                                }
                                .accentColor(Color.primary)
                            }
                        }
                    }
                    .textCase(.none)
                    .padding(.vertical, 3)
                    
                    // MARK: - Section 3
                    Section (header: Text ("Follow us on Social Media")) {
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link:
                                            "https://swiftuimasterclass.com")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://twitter.com/robertpetras")
                        FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Courses", link: "https://www.udemy.com/user/robert-petras")
                    }
                    .textCase(.none)
                    
                    // MARK: - Section 4
                    Section(header: Text("About")){
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "ToDo")
                        FormRowStaticView (icon: "checkmark.seal", firstText: "Compatability", secondText: "iPhone, iPad")
                        FormRowStaticView (icon: "keyboard", firstText: "Developer", secondText: "Terry Dengis")
                        FormRowStaticView (icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    }
                    .textCase(.none)
                    
                } // Form
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                // MARK: - Footer
                Text("Copyright © All rights reserved.\n Better Apps ♡ Less Code ")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(.secondary)
            } // VStack
            .navigationBarItems(
                trailing:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        Image(systemName: "xmark")
                    }
            )
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground"))
            .edgesIgnoringSafeArea(.all)
        } // NavigationView
        .accentColor(themes[theme.themeSettings].themeColor)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(IconNames())
            .environment(\.colorScheme, .light)
    }
}
