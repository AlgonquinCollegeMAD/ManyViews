//
//  Binding.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-15.
//

import SwiftUI

struct Binding_EverythingInASingleView: View {
  @State var on: Bool = false
  
  var body: some View {
    VStack {
      Image(systemName: on ? "bell.circle" : "bell.slash.circle")
        .symbolRenderingMode(.palette)
        .font(.system(size: 100))
        .foregroundStyle(on ? .green : .red, .blue)
        .symbolEffect(.wiggle, isActive: on)
        .padding()
      
      Button(on ? "Turn Off" : "Turn On") {
        withAnimation {
          on.toggle()
        }
      }
    }
  }
}

#Preview {
  Binding_EverythingInASingleView()
}

struct Binding_ThreeViews: View {
  @State var on: Bool = true
  var body: some View {
    VStack {
      MyBell(bellOn: $on)
      MyButton(isOn: $on)
    }
  }
}

struct MyBell: View {
  @Binding var bellOn: Bool
  var body: some View {
    Image(systemName: bellOn ? "bell.circle" : "bell.slash.circle")
      .symbolRenderingMode(.palette)
      .font(.system(size: 100))
      .foregroundStyle(bellOn ? .green : .red, .blue)
      .symbolEffect(.wiggle, isActive: bellOn)
      .padding()
  }
}
struct MyButton: View {
  @Binding var isOn: Bool
  var body: some View {
    Button(isOn ? "Turn Off" : "Turn On") {
      withAnimation {
        isOn.toggle()
      }
    }
  }
}

#Preview {
  Binding_ThreeViews()
}
