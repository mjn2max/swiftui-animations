//
// SwiftUIView.swift
// SwiftUI-Animations
//
// Created by Huy D. on 10/12/24
// mjn2max.github.io 😜
// 
// Copyright © 2024. All rights reserved.
// ___ORGANIZATIONNAME___
//

import SwiftUI

extension View {
    public func hLeading() -> some View {
        self.frame(maxWidth: .infinity, alignment: .leading)
    }

    public func hCenter() -> some View {
        self.frame(maxWidth: .infinity, alignment: .center)
    }

    public func hTrailing() -> some View {
        self.frame(maxWidth: .infinity, alignment: .trailing)
    }

    public func vTop() -> some View {
        self.frame(maxHeight: .infinity, alignment: .top)
    }

    public func vCenter() -> some View {
        self.frame(maxHeight: .infinity, alignment: .center)
    }

    public func vBottom() -> some View {
        self.frame(maxHeight: .infinity, alignment: .bottom)
    }
}
