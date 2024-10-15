//
//  ContentView.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-15.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
       List {
         ButtonSection()
         TextFieldSection()
         ToggleSection()
         StepperSection()
         SegmentedControlSection()
         DatePickerSection()
         ProgressViewSection()
         ActivityIndicatorSection()
         AlertsSection()
         ActionSheetsSection()
         NavigationLinkSection()
         ListSection()
         ScrollViewSection()
         SheetsSection()
         TabViewSection()
         FormSection()
         ForEachSection()
      }
       .navigationTitle("UI Controls")
    }
  }
}

#Preview {
  ContentView()
}
