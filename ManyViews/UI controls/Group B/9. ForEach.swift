//
//  ForEach.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct ForEachSection: View {
  var body: some View {
    Section("ForEach") {
      NavigationLink(destination: ForEachView1()) {
        Text("Displaying a List of Strings")
      }
      NavigationLink(destination: ForEachView2()) {
        Text("Generating a Grid of Numbers")
      }
      NavigationLink(destination: ForEachView3()) {
        Text("Generating a Grid of Numbers")
      }
      NavigationLink(destination: ForEachView4()) {
        Text("List of Items")
      }
      NavigationLink(destination: ForEachView5()) {
        Text("Conditional Styling")
      }
      NavigationLink(destination: ForEachView6()) {
        Text("Nested ForEach")
      }
    }
  }
}

// Displaying a List of Strings
struct ForEachView1: View {
  let items = ["Apple", "Banana", "Cherry"]
  
  var body: some View {
    VStack {
      ForEach(items, id: \.self) { item in
        Text(item)
          .font(.headline)
      }
    }
  }
}

#Preview {
  ForEachView1()
}

// Displaying a List of Custom Data
struct Item: Identifiable {
  var id = UUID()
  var name: String
}

struct ForEachView2: View {
  let items = [
    Item(name: "Apple"),
    Item(name: "Banana"),
    Item(name: "Cherry")
  ]
  
  var body: some View {
    VStack {
      ForEach(items) { item in
        Text(item.name)
          .font(.headline)
      }
    }
  }
}

#Preview {
  ForEachView2()
}

// Generating a Grid of Numbers
struct ForEachView3: View {
  let range = 1...5
  
  var body: some View {
    VStack {
      ForEach(range, id: \.self) { number in
        Text("Number \(number)")
          .font(.headline)
      }
    }
  }
}

#Preview {
  ForEachView3()
}

// List of Items
struct ForEachView4: View {
  let items = ["Apple", "Banana", "Cherry"]
  
  var body: some View {
    List {
      ForEach(items, id: \.self) { item in
        Text(item)
      }
    }
  }
}

#Preview {
  ForEachView4()
}

// Conditional Styling
struct ForEachView5: View {
  let items = ["Apple", "Banana", "Cherry"]
  
  var body: some View {
    VStack {
      ForEach(items, id: \.self) { item in
        Text(item)
          .font(.headline)
          .foregroundColor(item == "Banana" ? .yellow : .black)
      }
    }
  }
}

#Preview {
  ForEachView5()
}

// Nested ForEach
struct ForEachView6: View {
  let rows = [
    ["A", "B", "C"],
    ["D", "E", "F"],
    ["G", "H", "I"]
  ]
  
  var body: some View {
    VStack {
      ForEach(rows, id: \.self) { row in
        HStack {
          ForEach(row, id: \.self) { item in
            Text(item)
              .padding()
              .background(Color.gray.opacity(0.2))
              .cornerRadius(5)
          }
        }
      }
    }
  }
}

#Preview {
  ForEachView6()
}
