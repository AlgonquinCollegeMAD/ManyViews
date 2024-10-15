//
//  7. ProgressView.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//

import SwiftUI

struct ProgressViewSection: View {
  var body: some View {
    Section("Progress View") {
      NavigationLink(destination: ProgressView1()) {
        Text("Indeterminate ProgressView")
      }
      NavigationLink(destination: ProgressView2()) {
        Text("Determinate ProgressView")
      }
    }
  }
}


// Indeterminate ProgressView
public struct ProgressView1: View {
  public var body: some View {
    ProgressView()
        .progressViewStyle(CircularProgressViewStyle())
        .padding()
  }
}

#Preview {
  ProgressView1()
}

// Determinate ProgressView
public struct ProgressView2: View {
  @State private var progress: Double = 0.3
  public var body: some View {
    ProgressView(value: progress)
        .padding()
  }
}

#Preview {
  ProgressView2()
}
