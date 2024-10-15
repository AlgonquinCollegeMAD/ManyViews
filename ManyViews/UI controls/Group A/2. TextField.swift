//
//  2. TextField.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct TextFieldSection: View {
  var body: some View {
    Section("TextField") {
      NavigationLink(destination: TextField1()) {
        Text("Basic textfield")
      }
      NavigationLink(destination: TextFieldWithFormatting()) {
        Text("TextField with Formatting")
      }
      NavigationLink(destination: SecureFieldView()) {
        Text("Secure field")
      }
    }
  }
}

// Basic textfield
struct TextField1: View {
  @State private var name: String = ""

  var body: some View {
    TextField("Enter your name", text: $name)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
    
    Text(name.isEmpty ? " " : name)
      .fontWeight(.black)
      .font(.title)
      .foregroundStyle(.purple)
      .padding()
  }
}

#Preview {
  TextField1()
}

// TextField with Formatting
struct TextFieldWithFormatting: View {
  @State private var email: String = ""
  
  var body: some View {
    VStack {
      TextField("Email", text: $email)
        .keyboardType(.decimalPad)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
      
      Text(email.isEmpty ? " " : email)
        .padding()
    }
  }
}

#Preview {
  TextFieldWithFormatting()
}

// Secure field
struct SecureFieldView: View {
  @State var password: String = ""
  @State var isPasswordReadable: Bool = false
  
  var body: some View {
    HStack{
      if !isPasswordReadable{
        SecureField("Password", text: $password)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      } else {
        TextField("Password", text: $password)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      
      Button(action: {
        isPasswordReadable.toggle()
      }) {
        Image(systemName: isPasswordReadable ? "eye" : "eye.slash")
      }
    }
    .padding()
  }
}

#Preview {
  SecureFieldView()
}
