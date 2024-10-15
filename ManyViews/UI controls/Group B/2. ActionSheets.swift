//
//  ActionSheets.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct ActionSheetsSection: View {
  var body: some View {
    Section("Action Sheets") {
      NavigationLink(destination: ActionSheetView1()) {
        Text("Basic Action Sheet")
      }
      NavigationLink(destination: ActionSheetView2()) {
        Text("Action Sheets with Destructive Options")
      }
      NavigationLink(destination: ActionSheetView3()) {
        Text("Action Sheets with Multiple Actions")
      }
    }
  }
}


// Basic Action Sheet
struct ActionSheetView1: View {
  @State private var showActionSheet = false
  
  var body: some View {
    Button("Show Action Sheet") {
      showActionSheet = true
    }
    .actionSheet(isPresented: $showActionSheet) {
      ActionSheet(title: Text("Choose an Option"), message: Text("Select one of the options below."), buttons: [
        .default(Text("Option 1")) {
          print("Option 1 selected")
        },
        .default(Text("Option 2")) {
          print("Option 2 selected")
        },
        .cancel()
      ]
      )
    }
  }
}

#Preview {
  ActionSheetView1()
}

// Action Sheets with Destructive Options
struct ActionSheetView2: View {
  @State private var showActionSheet = false
  
  var body: some View {
    Button("Show Destructive Action Sheet") {
      showActionSheet = true
    }
    .actionSheet(isPresented: $showActionSheet) {
      ActionSheet(title: Text("Delete Item"), message: Text("This action cannot be undone."), buttons: [
        .destructive(Text("Delete")) {
          print("Item deleted")
        },
        .cancel()
      ])
    }
  }
}

#Preview {
  ActionSheetView2()
}

// Action Sheets with Multiple Actions
struct ActionSheetView3: View {
  @State private var showActionSheet = false
  
  var body: some View {
    Button("Show Multi-Option Action Sheet") {
      showActionSheet = true
    }
    .actionSheet(isPresented: $showActionSheet) {
      ActionSheet(title: Text("Choose Your Action"), buttons: [
        .default(Text("Save")) {
          print("Save selected")
        },
        .default(Text("Share")) {
          print("Share selected")
        },
        .default(Text("Edit")) {
          print("Edit selected")
        },
        .cancel()
      ])
    }
  }
}

#Preview {
  ActionSheetView3()
}
