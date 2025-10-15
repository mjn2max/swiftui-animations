//
// FadeAnimations.swift
// SwiftUI-Animations
//
// Created by Huy D. on 6/26/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// CodePassion.dev
//

import SwiftUI

// MARK: - Fade Animations

public extension View {
    /// Applies a fade based on a Boolean value.
    ///
    /// - Parameters:
    ///   - isVisible: When `true`, the view is fully opaque; when `false`, fully transparent.
    ///   - duration: Animation duration.
    ///   - curve: Timing curve.
    /// - Returns: A view that animates its opacity when `isVisible` changes.
    ///
    /// # Usage
    /// ```swift
    /// Text("Hello")
    ///     .fade(isVisible: showText, duration: 0.25, curve: .easeInOut)
    /// ```
    func fade(isVisible: Bool, duration: Double = 0.25, curve: Animation = .easeInOut) -> some View {
        self
            .opacity(isVisible ? 1.0 : 0.0)
            // Note: `Animation` doesn't provide a `.duration(_:)` mutator.
            // Apply the duration directly on a concrete animation.
            .animation(.easeInOut(duration: duration), value: isVisible)
    }
}
struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
