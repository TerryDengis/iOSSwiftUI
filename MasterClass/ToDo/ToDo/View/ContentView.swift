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
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.priority, ascending: false), NSSortDescriptor(keyPath: \ToDoItem.name, ascending: true)]) private var items: FetchedResults<ToDoItem>
    @EnvironmentObject var iconSettings: IconNames
    
    // MARK: - Properties
    @State private var showingAddToDoView: Bool = false
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
            // TODO: - animation not working properly
            .overlay(AnimatedButtonView(showView: $showingAddToDoView), alignment: .bottomTrailing)

        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func colorize (priority: String) -> Color {
        switch priority {
        case "Urgent":
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

        let persistenceController = PersistenceController.shared
        
        ContentView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .environmentObject(IconNames())
    }
}


extension View {
    func animateForever(using animation: Animation = Animation.easeInOut(duration: 1), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation.repeatForever(autoreverses: autoreverses)
        
        return onAppear {
            withAnimation(repeated) {
                action()
            }
        }
    }
}
