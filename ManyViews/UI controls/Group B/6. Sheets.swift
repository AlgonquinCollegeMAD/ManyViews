
//
//  Sheets.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct SheetsSection: View {
  var body: some View {
    Section("Sheets") {
      NavigationLink(destination: SheetsView1()) {
        Text("Basic Sheet")
      }
      NavigationLink(destination: SheetsView2()) {
        Text("Binding Sheet")
      }
      NavigationLink(destination: SheetsView3()) {
        Text("Interaction Between Views")
      }
    }
  }
}


// Basic Sheet
struct SheetsView1: View {
  @State private var isSheetPresented = false
  
  var body: some View {
    VStack {
      Button("Show Sheet") {
        isSheetPresented = true
      }
      .sheet(isPresented: $isSheetPresented) {
        Text("Hello, this is a sheet!")
          .font(.largeTitle)
          .padding()
      }
    }
  }
}

#Preview {
  SheetsView1()
}

// Binding Sheets
struct SheetsView2: View {
  @State private var isSheetPresented = false
  @State private var textToDisplay = "Hello from ContentView!"
  
  var body: some View {
    VStack {
      
      Button("Show Sheet") {
        isSheetPresented = true
      }
      .sheet(isPresented: $isSheetPresented) {
        SheetView2(text: $textToDisplay)
      }
    }
  }
}

struct SheetView2: View {
  @Binding var text: String
  
  var body: some View {
    VStack {
      Text(text)
        .font(.largeTitle)
        .padding()
      Button("Change Text") {
        text = "Text updated from SheetView!"
      }
    }
  }
}

#Preview {
  SheetsView2()
}

// Interaction Between Views
struct SheetsView3: View {
      @State private var isSheetPresented = false

      var body: some View {
          VStack {
              Button("Show Sheet") {
                  isSheetPresented = true
              }
              .sheet(isPresented: $isSheetPresented) {
                  SheetView3(isPresented: $isSheetPresented)
              }
          }
      }
  }

  struct SheetView3: View {
      @Binding var isPresented: Bool

      var body: some View {
          VStack {
              Text("Tap to dismiss")
                  .font(.largeTitle)
                  .padding()
              Button("Dismiss") {
                  isPresented = false
              }
          }
      }
  }

#Preview {
  SheetsView3()
}
