//
//  4. Stepper.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct StepperSection: View {
  var body: some View {
    Section("Stepper") {
      NavigationLink(destination: StepperView1()) {
        Text("Basic Stepper")
      }
    }
  }
}

// Basic Stepper
struct StepperView1: View {
  @State private var value1: Int = 0
  @State private var value2: Int = 0
  @State private var value3: Int = 0
  
  var body: some View {
    Form {
      Stepper("Value: \(value1)", value: $value1, in: 0...10)
      Stepper("Value: \(value2)", value: $value2, in: 0...100, step: 11)
    }
  }
}

#Preview {
  StepperView1()
}
