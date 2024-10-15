//
//  4. List.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct ListSection: View {
  var body: some View {
    Section("List") {
      NavigationLink(destination: ListView1()) {
        Text("Basic List")
      }
      NavigationLink(destination: ListView2()) {
        Text("Dynamic Lists")
      }
      NavigationLink(destination: ListView3()) {
        Text("Customizing List Rows")
      }
      NavigationLink(destination: ListView4()) {
        Text("Using ForEach Inside List")
      }
      NavigationLink(destination: ListView5()) {
        Text("Using ForEach Inside List")
      }
      NavigationLink(destination: ListView6()) {
        Text("Editing and Deleting Items")
      }
      NavigationLink(destination: ListView7()) {
        Text("List with Navigation")
      }
    }
  }
}


// Basic List
struct ListView1: View {
  let items = [
      "Apple", "Banana", "Cherry", "Date", "Elderberry",
      "Fig", "Grape", "Honeydew", "Indian Fig", "Jackfruit",
      "Kiwi", "Lemon", "Mango", "Nectarine", "Orange",
      "Papaya", "Quince", "Raspberry", "Strawberry", "Tangerine",
      "Ugli fruit", "Voavanga", "Watermelon", "Xigua", "Yellow Passion Fruit",
      "Zucchini", "Acai Berry", "Blueberry", "Cantaloupe", "Durian",
      "Lychee", "Mulberry", "Olive", "Peach", "Pineapple",
      "Pomegranate", "Starfruit", "Tamarind", "Coconut", "Gooseberry"
  ]

    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
        }
    }
}

#Preview {
  ListView1()
}

// Dynamic Lists
struct Fruit: Identifiable {
    let id = UUID()
    let name: String
}

struct ListView2: View {
  @State private var fruits = [
      Fruit(name: "Apple"),
      Fruit(name: "Banana"),
      Fruit(name: "Cherry"),
      Fruit(name: "Date"),
      Fruit(name: "Elderberry"),
      Fruit(name: "Fig"),
      Fruit(name: "Grape"),
      Fruit(name: "Honeydew"),
      Fruit(name: "Indian Fig"),
      Fruit(name: "Jackfruit"),
      Fruit(name: "Kiwi"),
      Fruit(name: "Lemon"),
      Fruit(name: "Mango"),
      Fruit(name: "Nectarine"),
      Fruit(name: "Orange"),
      Fruit(name: "Papaya"),
      Fruit(name: "Quince"),
      Fruit(name: "Raspberry"),
      Fruit(name: "Strawberry"),
      Fruit(name: "Tangerine"),
      Fruit(name: "Ugli fruit"),
      Fruit(name: "Voavanga"),
      Fruit(name: "Watermelon"),
      Fruit(name: "Xigua"),
      Fruit(name: "Yellow Passion Fruit"),
      Fruit(name: "Zucchini"),
      Fruit(name: "Acai Berry"),
      Fruit(name: "Blueberry"),
      Fruit(name: "Cantaloupe"),
      Fruit(name: "Durian"),
      Fruit(name: "Lychee"),
      Fruit(name: "Mulberry"),
      Fruit(name: "Olive"),
      Fruit(name: "Peach"),
      Fruit(name: "Pineapple"),
      Fruit(name: "Pomegranate"),
      Fruit(name: "Starfruit"),
      Fruit(name: "Tamarind"),
      Fruit(name: "Coconut"),
      Fruit(name: "Gooseberry")
  ]

    var body: some View {
        List(fruits) { fruit in
            Text(fruit.name)
        }
    }
}

#Preview {
  ListView2()
}

// Customizing List Rows
struct ListView3: View {
    let items = ["Apple", "Banana", "Cherry"]

    var body: some View {
        List(items, id: \.self) { item in
            HStack {
                Image(systemName: "fruit")
                Text(item)
                    .font(.headline)
                Spacer()
                Image(systemName: "star")
            }
            .padding()
        }
    }
}

#Preview {
  ListView3()
}

// Using ForEach Inside List
struct ListView4: View {
  let items = [
      "Toronto", "Vancouver", "Montreal", "Calgary", "Ottawa", "Edmonton", "Quebec City", "Winnipeg", "Halifax", "Victoria"
  ]

    var body: some View {
        List {
          ForEach(items, id: \.self) { item in
                Text(item)
            }
        }
    }
}

#Preview {
  ListView4()
}

// Editing and Deleting Items
struct ListView5: View {
    @State private var items = [
      "Toronto", "Vancouver", "Montreal", "Calgary", "Ottawa", "Edmonton", "Quebec City", "Winnipeg", "Halifax", "Victoria"
  ]

    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Text(item)
            }
            .onDelete(perform: delete)
            .onMove(perform: move)
        }
        .toolbar {
            EditButton()
        }
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
  ListView5()
}

// Sectioning in Lists
struct ListView6: View {
    let fruits = ["Apple", "Banana", "Cherry"]
    let vegetables = ["Carrot", "Broccoli", "Spinach"]

    var body: some View {
        List {
            Section(header: Text("Fruits")) {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
            }
            Section(header: Text("Vegetables")) {
                ForEach(vegetables, id: \.self) { vegetable in
                    Text(vegetable)
                }
            }
        }
    }
}

#Preview {
  ListView6()
}

// List with Navigation
struct ListView7: View {
    let items = ["Apple", "Banana", "Cherry"]

    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                NavigationLink(destination: DetailListViewView7(item: item)) {
                    Text(item)
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

struct DetailListViewView7: View {
    let item: String

    var body: some View {
        Text("Details for \(item)")
            .font(.largeTitle)
    }
}

#Preview {
  ListView7()
}
