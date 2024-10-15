//
//  1. Button.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct ButtonSection: View {
  var body: some View {
    Section("Button") {
      NavigationLink(destination: ButtonView1()) {
        Text("Basic button")
      }
      NavigationLink(destination: ButtonView2()) {
        Text("Button with image")
      }
    }
  }
}

//Basic button
struct ButtonView1: View {
  var body: some View {
    Button(action: {
      //NOOP
    }) {
      Text("Press Me")
    }
    .padding()
    .background(Color.blue)
    .foregroundColor(.white)
    .cornerRadius(8)
  }
}

#Preview {
  ButtonView1()
}

// Button with image
struct ButtonView2: View {
  var body: some View {
    Button(action: {
      //NOOP
    }) {
      Image(systemName: "figure.racquetball.circle.fill")
        .font(.largeTitle)
        .foregroundColor(.yellow)
        .symbolEffect(.pulse)
    }
  }
}

#Preview {
  ButtonView2()
}

