//
// ContentView.swift
// swiftui-app
//
// Created by Huy D. on 11/27/22
// mjn2max.github.io 😜
// 
// Copyright © 2022 mjn2max.com. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
