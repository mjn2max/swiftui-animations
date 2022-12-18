//
// ContentView.swift
// swiftui-fundamentals
//
// Created by Huy D. on 12/18/22
// mjn2max.github.io 😜
// 
// Copyright © 2022. All rights reserved.
// mjn2max.com
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
