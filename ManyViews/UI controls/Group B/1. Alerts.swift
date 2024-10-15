//
//  SimpleAlert.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct AlertsSection: View {
  var body: some View {
    Section("Alerts") {
      NavigationLink(destination: AlertView1()) {
        Text("Basic Alert")
      }
      NavigationLink(destination: AlertView2()) {
        Text("Multiple Buttons Alert")
      }
      NavigationLink(destination: AlertView3()) {
        Text("Dynamic Content in an Alert")
      }
    }
  }
}


// Basic Alert
struct AlertView1: View {
  @State private var showAlert = false
  
  var body: some View {
    Button("Show Alert") {
      showAlert = true
    }
    .alert("Important Message", isPresented: $showAlert) {
      Button("OK", role: .cancel) { }
    }
  }
}

#Preview {
  AlertView1()
}

// Multiple Buttons Alert
struct AlertView2: View {
  @State private var showAlert = false
  
  var body: some View {
    Button("Show Alert") {
      showAlert = true
    }
    .alert("Are you sure?", isPresented: $showAlert) {
      Button("Delete", role: .destructive) {
        print("Item deleted")
      }
      Button("Cancel", role: .cancel) {
        //NOOP
      }
    }
  }
}


#Preview {
  AlertView2()
}

// Dynamic Content in an Alert
struct AlertView3: View {
  @State private var showAlert = false
  @State private var alertMessage = ""
  
  var body: some View {
    VStack {
      Button("Show Success Alert") {
        alertMessage = "Operation was successful!"
        showAlert = true
      }
      
      Button("Show Error Alert") {
        alertMessage = "Something went wrong."
        showAlert = true
      }
    }
    .alert("Notice", isPresented: $showAlert) {
      Button("OK", role: .cancel) {
        //NOOP
      }
    } message: {
      Text(alertMessage)
    }
  }
}

#Preview {
  AlertView3()
}
