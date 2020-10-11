//
//  ContentView.swift
//  ToDo
//
//  Created by Terry Dengis on 10/7/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.name, ascending: true)]) private var items: FetchedResults<ToDoItem>
    @EnvironmentObject var iconSettings: IconNames
    
    // MARK: - Properties
    @State private var showingAddToDoView: Bool = false
    @State private var animatingButton: Bool = false
    @State private var showingSettingsView: Bool = false
    
    @ObservedObject var theme = ThemeSettings.shared
    let themes: [Theme] = themeData
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach (items, id:\.self) { item in
                        HStack {
                            Circle ()
                                .frame(width: 12, height: 12, alignment: .center)
                                .foregroundColor(colorize(priority: item.priority ?? " Normal"))
                            Text(item.name ?? "Unkown")
                                .fontWeight(.semibold)
                            Spacer()
                            Text(item.priority ?? "Unkown")
                                .font(.footnote)
                                .foregroundColor(Color(UIColor.systemGray2))
                                .padding(3)
                                .frame(minWidth: 62)
                                .overlay(
                                    Capsule()
                                        .stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                                )
                        }
                        .padding(.vertical, 10)
                    }
                    .onDelete(perform: deleteItem)
                }
                
                .navigationBarTitle("ToDo")
                .navigationBarItems(
                    leading:
                        EditButton ()
                            .accentColor(themes[theme.themeSettings].themeColor),
                    trailing:
                        Button(action:{
                            showingSettingsView.toggle()
                        }) {
                            Image(systemName: "paintbrush")
                                .imageScale(.large)
                        }
                        .accentColor(themes[theme.themeSettings].themeColor)
                        .sheet (isPresented: $showingSettingsView) {
                            SettingsView().environmentObject(iconSettings)
                        }
                )
                if items.count == 0 {
                    EmptyListView()
                }
            } // ZStack
            .sheet (isPresented: $showingAddToDoView) {
                AddToDoView().environment(\.managedObjectContext, viewContext)
            }
            .overlay(
                ZStack {
                    ZStack {
                        Circle()
                            .fill(themes[theme.themeSettings].themeColor)
                            .opacity (animatingButton ? 0.5 : 0.01)
                            .scaleEffect(animatingButton ? 1.0 : 0.1)
                            .frame(width: 68, height: 68, alignment: .center)
                        Circle()
                            .fill(themes[theme.themeSettings].themeColor)
                            .opacity (animatingButton ? 0.3 : 0.01)
                            .scaleEffect(animatingButton ? 1.0 : 0.1)
                            .frame(width: 88, height: 88, alignment: .center)
                    }
                    .animation(animatingButton ? Animation.easeInOut(duration: 2).repeatForever(autoreverses: true) : .default)
                    
                    Button(action: {
                        showingAddToDoView.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    }
                    .onAppear {
                        //animatingButton.toggle()
                    }
                    .accentColor (themes[theme.themeSettings].themeColor)
                } // ZStack
                .padding(.bottom, 15)
                .padding(.trailing, 15)
                , alignment: .bottomTrailing
            ) // Overlay
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func colorize (priority: String) -> Color {
        switch priority {
        case "High":
            return .pink
        case "Normal":
            return .green
        case "Low":
            return .blue
        default:
            return .gray
        }
    }
    
    private func deleteItem(at offsets: IndexSet) {

        offsets.map { items[$0] }.forEach(viewContext.delete)
        do {
            try viewContext.save()
        } catch {
            print (error)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext

        return ContentView()
            .environment(\.managedObjectContext, viewContext)
    }
}
