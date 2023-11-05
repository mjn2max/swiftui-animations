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
        NavigationView {
            List {
                Section("Components") {
                    Text("Text")
                    Text("Button")
                    Text("Image")
                    Text("List")
                    Text("View")
                    Text("Form")
                    Text("DatePicker")
                    Text("Slider")
                    Text("Toggle")
                }
            }
            .navigationTitle("SwiftUI Fundamentals")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
