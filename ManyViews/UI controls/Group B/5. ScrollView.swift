//
//  5. ScrollView.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct ScrollViewSection: View {
  var body: some View {
    Section("Scrollview") {
      NavigationLink(destination: ScrollView1()) {
        Text("Basic ScrollView")
      }
      NavigationLink(destination: ScrollView2()) {
        Text("Horizontal Scrolling")
      }
      NavigationLink(destination: ScrollView3()) {
        Text("Combining Vertical and Horizontal Scroll")
      }
      NavigationLink(destination: ScrollView4()) {
        Text("The ScrollViewReader")
      }
      NavigationLink(destination: ScrollView5()) {
        Text("Practical Example")
      }
    }
  }
}


// Basic ScrollView
struct ScrollView1: View {
  var body: some View {
    ScrollView {
      VStack {
        ForEach(0..<50) { index in
          Text("Item \(index)")
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(8)
        }
      }
    }
  }
}

#Preview {
  ScrollView1()
}

// Horizontal Scrolling
struct ScrollView2: View {
  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        ForEach(0..<50) { index in
          Text("Item \(index)")
            .padding()
            .background(Color.red.opacity(0.1))
            .cornerRadius(8)
        }
      }
    }
  }
}

#Preview {
  ScrollView2()
}

// Combining Vertical and Horizontal Scroll
struct ScrollView3: View {
  var body: some View {
    ScrollView {
      VStack {
        ForEach(0..<10) { row in
          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              ForEach(0..<10) { column in
                Text("Item (\(row),\(column))")
                  .padding()
                  .background(Color.green.opacity(0.1))
                  .cornerRadius(8)
              }
            }
          }
          .frame(height: 100)
        }
      }
    }
  }
}

#Preview {
  ScrollView3()
}

// The ScrollViewReader
struct ScrollView4: View {
  @State private var scrollToIndex: Int? = nil
  
  var body: some View {
    VStack {
      Button("Scroll to Item 25") {
        scrollToIndex = 25
      }
      
      ScrollViewReader { proxy in
        ScrollView {
          VStack {
            ForEach(0..<50) { index in
              Text("Item \(index)")
                .padding()
                .background(Color.purple.opacity(0.1))
                .cornerRadius(8)
                .id(index) // Assign ID for ScrollViewReader
            }
          }
          .onChange(of: scrollToIndex) { oldValue, newValue in
            if let newValue = newValue {
              withAnimation {
                proxy.scrollTo(newValue, anchor: .center)
              }
            }
          }
        }
      }
    }
  }
}

#Preview {
  ScrollView4()
}

// Practical Example
struct ScrollView5: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var birthDate: Date = Date()
    @State private var isSubscribed: Bool = false
    @State private var selectedColor: String = "Red"
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var age: Double = 18
    @State private var feedback: String = ""
    @State private var experienceLevel: Int = 1
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Text Field for Name
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Text Field for Email
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Date Picker for Birth Date
                DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                // Toggle for Subscription
                Toggle(isOn: $isSubscribed) {
                    Text("Subscribe to Newsletter")
                }
                .padding()
                
                // Picker for Color Selection
                Picker("Favorite Color", selection: $selectedColor) {
                    Text("Red").tag("Red")
                    Text("Green").tag("Green")
                    Text("Blue").tag("Blue")
                    Text("Yellow").tag("Yellow")
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                
                // Secure Text Field for Password
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Secure Text Field for Confirm Password
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Slider for Age
                VStack {
                    Text("Age: \(Int(age))")
                    Slider(value: $age, in: 0...100, step: 1)
                        .padding()
                }
                
                // Text Field for Feedback
                TextField("Feedback", text: $feedback)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Stepper for Experience Level
                Stepper("Experience Level: \(experienceLevel)", value: $experienceLevel, in: 1...10)
                    .padding()
                
                // Additional Notes
                TextField("Additional Notes", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Spacer to push content up
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ScrollView5()
}


#Preview {
  ScrollView5()
}
