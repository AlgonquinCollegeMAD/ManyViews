//
//  3. NavigationLink.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct NavigationLinkSection: View {
  var body: some View {
    Section("Navigation Link") {
      NavigationLink(destination: NavigationLinkView1()) {
        Text("Basic example of using NavigationLink")
      }
      NavigationLink(destination: NavigationLinkView2()) {
        Text("Customizing NavigationLink Appearance")
      }
      NavigationLink(destination: NavigationLinkView3()) {
        Text("NavigationLink with List")
      }
      NavigationLink(destination: NavigationLinkView4()) {
        Text("Passing Data Through NavigationLink")
      }
    }
  }
}


// Basic example of using NavigationLink
struct NavigationLinkView1: View {
  var body: some View {
    NavigationStack {
      VStack {
        Text("Welcome to the Main View")
        
        NavigationLink(destination: NavigationLinkDetailView1()) {
          Text("Go to Detail View")
            .font(.headline)
            .foregroundColor(.blue)
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
        }
      }
      .navigationTitle("Home")
    }
  }
}

struct NavigationLinkDetailView1: View {
  var body: some View {
    Text("This is the Detail View")
      .font(.largeTitle)
      .padding()
      .navigationTitle("Detail")
  }
}

#Preview {
  NavigationLinkView1()
}

// Customizing NavigationLink Appearance
struct NavigationLinkView2: View {
  var body: some View {
    NavigationStack {
      VStack {
        NavigationLink(destination: NavigationLinkDetailView2()) {
          HStack {
            Image(systemName: "arrow.right.circle")
              .font(.largeTitle)
              .foregroundColor(.green)
            Text("Navigate to Detail")
              .font(.title)
              .foregroundColor(.black)
          }
          .padding()
          .background(Color.orange)
          .cornerRadius(15)
        }
      }
      .navigationTitle("Custom Link")
    }
  }
}

struct NavigationLinkDetailView2: View {
  var body: some View {
    Text("Detailed View Content")
      .font(.largeTitle)
      .padding()
      .navigationTitle("Detail")
  }
}

#Preview {
  NavigationLinkView2()
}

// NavigationLink with List
struct NavigationLinkView3: View {
  let items = ["Item 1", "Item 2", "Item 3"]
  
  var body: some View {
    NavigationStack {
      List(items, id: \.self) { item in
        NavigationLink(destination: NavigationLinkDetailView3(item: item)) {
          Text(item)
        }
      
      }
      .navigationTitle("Item List")
    }
  }
}

struct NavigationLinkDetailView3: View {
  var item: String
  
  var body: some View {
    Text("Detail for \(item)")
      .font(.largeTitle)
      .padding()
      .navigationTitle(item)
  }
}

#Preview {
  NavigationLinkView3()
}

// Passing Data Through NavigationLink
struct NavigationLinkView4: View {
  var body: some View {
    NavigationStack {
      NavigationLink(destination: NavigationLinkDetailView4(name: "John Doe")) {
        Text("Navigate with Data")
          .padding()
          .background(Color.purple)
          .cornerRadius(10)
          .foregroundColor(.white)
      }
      .navigationTitle("Home")
    }
  }
}

struct NavigationLinkDetailView4: View {
  var name: String
  
  var body: some View {
    Text("Hello, \(name)!")
      .font(.largeTitle)
      .padding()
      .navigationTitle("Personalized Greeting")
  }
}

#Preview {
  NavigationLinkView4()
}
