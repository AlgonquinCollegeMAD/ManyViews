//
//  3. Toggle.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct ToggleSection: View {
  var body: some View {
    Section("Togle") {
      NavigationLink(destination: ToggleView1()) {
        Text("Basic Toggle")
      }
    }
  }
}

// Basic Toggle
struct ToggleView1: View {
  @State private var isOn: Bool = false
  
  var body: some View {
    VStack {
      Toggle("Enable Notifications", isOn: $isOn)
          .padding()
      
      Text(isOn ? "Notifications are enabled" : "You will not get notified")
        .padding()
    }
  }
}

#Preview {
  ToggleView1()
}
