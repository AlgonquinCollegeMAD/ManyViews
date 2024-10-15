//
//  7. TabView.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct TabViewSection: View {
  var body: some View {
    Section("TabView") {
      NavigationLink(destination: TabView1()) {
        Text("Basic example")
      }
      NavigationLink(destination: TabView2()) {
        Text("Customizing Tab Items")
      }
      NavigationLink(destination: TabView3()) {
        Text("Custom Tab Bar")
      }
      NavigationLink(destination: TabView4()) {
        Text("Dynamic Tab Items")
      }
      NavigationLink(destination: TabView5()) {
        Text("Handling Tab Selection")
      }
    }
  }
}


// Basic example
struct TabView1: View {
  var body: some View {
    TabView {
      Text("Home View")
        .tabItem {
          Image(systemName: "house.fill")
          Text("Home")
        }
      
      Text("Settings View")
        .tabItem {
          Image(systemName: "gearshape.fill")
          Text("Settings")
        }
    }
  }
}

#Preview {
  TabView1()
}

// Customizing Tab Items
struct TabView2: View {
  var body: some View {
    TabView {
      Text("Profile View")
        .tabItem {
          Image(systemName: "person.fill")
            .renderingMode(.original)
          Text("Profile")
        }
        .badge(3)
      
      Text("Messages View")
        .tabItem {
          Image(systemName: "message.fill")
            .renderingMode(.original)
          Text("Messages")
        }
        .badge(5)
    }
  }
}

#Preview {
  TabView2()
}

// Custom Tab Bar
struct TabView3: View {
  var body: some View {
    TabView {
      TabView3HomeView()
        .tabItem {
          Label("Home", systemImage: "house.fill")
        }
      
      TabView3SettingsView()
        .tabItem {
          Label("Settings", systemImage: "gearshape.fill")
        }
    }
    .accentColor(.purple)
  }
}

struct TabView3HomeView: View {
  var body: some View {
    Text("Welcome to Home")
  }
}

struct TabView3SettingsView: View {
  var body: some View {
    Text("Settings Page")
  }
}

#Preview {
  TabView3()
}

// Dynamic Tab Items
struct TabView4: View {
  let tabs = ["Home", "Settings", "Profile"]
  
  var body: some View {
    TabView {
      ForEach(tabs, id: \.self) { tab in
        Text("\(tab) View")
          .tabItem {
            Image(systemName: "star.fill")
            Text(tab)
          }
      }
    }
  }
}

#Preview {
  TabView4()
}

// Handling Tab Selection
struct TabView5: View {
  @State private var selectedTab = 0
  
  var body: some View {
    TabView(selection: $selectedTab) {
      Text("First View")
        .tabItem {
          Text("First")
        }
        .tag(0)
      
      Text("Second View")
        .tabItem {
          Text("Second")
        }
        .tag(1)
    }
    .onChange(of: selectedTab) { newValue, oldvalue in
      print("Selected tab: \(newValue)")
    }
  }
}

#Preview {
  TabView5()
}
