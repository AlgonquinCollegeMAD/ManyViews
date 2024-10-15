//
//  Untitled.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct FormSection: View {
  var body: some View {
    Section("Form") {
      NavigationLink(destination: FormView1()) {
        Text("Basic Form")
      }
    }
  }
}


// Basic Form
struct FormView1: View {
  @State private var name: String = ""
  @State private var age: Int = 18
  @State private var isSubscribed: Bool = false
  @State private var selectedColor: Color = .blue
  
  var body: some View {
    Form {
      Section(header: Text("Personal Information")) {
        TextField("Name", text: $name)
        Stepper(value: $age, in: 0...100) {
          Text("Age: \(age)")
        }
      }
      
      Section(header: Text("Preferences")) {
        Toggle("Subscribe to Newsletter", isOn: $isSubscribed)
        
        Picker("Favorite Color", selection: $selectedColor) {
          Text("Red").tag(Color.red)
          Text("Green").tag(Color.green)
          Text("Blue").tag(Color.blue)
        }
        .pickerStyle(SegmentedPickerStyle())
        //        .pickerStyle(MenuPickerStyle()) //alternative
        //        .pickerStyle(WheelPickerStyle())  alternative
      }
    }
  }
}

#Preview {
  FormView1()
}
