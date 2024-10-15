//
//  5. Segmented Control.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct SegmentedControlSection: View {
  var body: some View {
    Section("Segmented Control") {
      NavigationLink(destination: SegmentedControlView1()) {
        Text("Basic Segmented Control")
      }
      NavigationLink(destination: SegmentedControlView2()) {
        Text("Advanced Segmented Control")
      }
    }
  }
}


// Basic Segmented Control
struct SegmentedControlView1: View {
  @State private var selectedSegment = 0
  
  var body: some View {
    Picker("Select Option", selection: $selectedSegment) {
      Text("Option 1").tag(0)
      Text("Option 2").tag(1)
      Text("Option 3").tag(2)
    }
    .pickerStyle(SegmentedPickerStyle())
    .padding()
    
    switch selectedSegment {
    case 0:
      Text("Option 1 selected")
    case 1:
      Text("Option 2 selected")
    case 2:
      Text("Option 3 selected")
    default:
      Text("Unknown selection")
    }
  }
}

#Preview {
  SegmentedControlView1()
}

// Advanced Segmented Control
enum PossibleOptions: Int, CaseIterable {
  case sky = 0
  case blood
  case sun
  
  var name: String {
    switch self {
    case .sky:
      return "Sky"
    case .blood:
      return "Blood"
    case .sun:
      return "Sun"
    }
  }
  
  var color: Color {
    switch self {
    case .sky:
      return Color.blue
    case .blood:
      return Color.red
    case .sun:
      return Color.yellow
    }
  }
}

struct SegmentedControlView2: View {
  @State private var selectedSegment: PossibleOptions = .sky
  
  var body: some View {
    VStack {
      Picker("Select Option", selection: $selectedSegment) {
        ForEach(PossibleOptions.allCases, id: \.self) { option in
          Text(option.name).tag(option)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
      .padding()
      
      Text("\(selectedSegment.name) selected")
        .foregroundColor(selectedSegment.color) // Use the corresponding color
        .font(.title)
    }
  }
}




#Preview {
  SegmentedControlView2()
}
