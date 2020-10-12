//
//  AddToDoView.swift
//  ToDo
//
//  Created by Terry Dengis on 10/7/20.
//

import SwiftUI

struct AddToDoView: View {
    // MARK: - Properties
    @Environment (\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    @ObservedObject var theme = ThemeSettings.shared
    let themes: [Theme] = themeData
    
    let priorities = ["Urgent", "Normal", "Low"]
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                VStack (alignment: .leading, spacing: 20) {
                    TextField("ToDo", text:$name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24, weight: .bold, design: .default))
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Button(action: {
                        if name != "" {
                            let item = ToDoItem(context: viewContext)
                            item.name = name
                            item.priority = priority
                            do {
                                try viewContext.save()
                            } catch {
                                print (error)
                            }
                        } else {
                            errorShowing = true
                            errorTitle = " Invalid Name"
                            errorMessage = "Make sure to enter somthing for the item"
                            return
                        }
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(themes[theme.themeSettings].themeColor)
                            .cornerRadius(9)
                            .foregroundColor(Color.white )
                    }
                } // VStack
                .padding(.horizontal)
                .padding(.vertical, 30)
                Spacer()
            } // VStack
            .navigationBarTitle("New ToDo", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
            })
            .alert(isPresented: $errorShowing) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        } // NavigationView
        .accentColor(themes[theme.themeSettings].themeColor)
    }
}

struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView()
    }
}
