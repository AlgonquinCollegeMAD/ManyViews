//
//  6. DatePicker.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct DatePickerSection: View {
  var body: some View {
    Section("Date Picker") {
      NavigationLink(destination: DatePickerView1()) {
        Text("Basic DatePicker")
      }
      NavigationLink(destination: DatePickerView2()) {
        Text("DatePicker with Range")
      }
    }
  }
}


// Basic DatePicker
struct DatePickerView1: View {
  @State private var selectedDate = Date()
  
  var body: some View {
    DatePicker("Date",
               selection: $selectedDate,
               displayedComponents: [.hourAndMinute]
    )
    .datePickerStyle(WheelDatePickerStyle())
    .padding()
  }
}

#Preview {
  DatePickerView1()
}

// DatePicker with Range
struct DatePickerView2: View {
  @State private var selectedDate = Date()
  
  var body: some View {
    DatePicker("Select Date",
               selection: $selectedDate,
               in: Date()...Date().addingTimeInterval(60*60*24*365),
               displayedComponents: [.date]
    )
    .datePickerStyle(GraphicalDatePickerStyle())
    .padding()
    
    Text("\(selectedDate)")
  }
}



#Preview {
  DatePickerView2()
}
