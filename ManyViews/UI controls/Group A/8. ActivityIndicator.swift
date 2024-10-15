//
//  8. ActivityIndicator.swift
//  ManyViews
//
//  Created by Vladimir Cezar on 2024-10-17.
//


import SwiftUI

struct ActivityIndicatorSection: View {
  var body: some View {
    Section("Activity Indicator") {
      NavigationLink(destination: ActivityIndicatorView()) {
        Text("Basic Activity Indicator")
      }
      NavigationLink(destination: LoadingView()) {
        Text(" Advanced Activity Indicator")
      }
    }
  }
}


// Basic Activity Indicator
struct ActivityIndicatorView: View {
  var body: some View {
    ProgressView()
      .progressViewStyle(CircularProgressViewStyle())
      .scaleEffect(3.0)
      .padding()
  }
}

// Advanced Activity Indicator
enum PossibleViewStates {
  case idle
  case loading
  case success
}

struct LoadingView: View {
  @State private var viewState: PossibleViewStates = .idle
  
  var body: some View {
    VStack {
      ZStack {
        RoundedRectangle(cornerRadius: 20)
          .fill(Color.clear)
          .frame(width: 100, height: 100)
          .overlay(
            RoundedRectangle(cornerRadius: 20)
              .stroke(Color.black, lineWidth: 1)
          )
          .shadow(radius: 5)
        
        switch viewState {
        case .idle:
          EmptyView()
    
        case .loading:
          ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(1.5)
            .padding()
          
        case .success:
          Image(systemName: "checkmark.circle.fill")
            .font(.system(size: 50))
            .foregroundColor(.green)
            .padding()
        }
      }
      
      HStack {
        Button {
          viewState = .loading
          DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            viewState = .success
          }
        } label: {
          Text("Load")
            .font(.headline)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        
        Button {
          viewState = .idle
        } label: {
          Text("Reset")
            .font(.headline)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
      }
      .padding(.top, 16)
    }
    .padding()
  }
}

#Preview {
  ActivityIndicatorView()
}

#Preview {
  LoadingView()
}
