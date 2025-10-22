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

    /// Fades the view in when it appears.
    ///
    /// - Parameters:
    ///   - duration: Animation duration.
    ///   - delay: Optional delay before starting.
    /// - Returns: A view that animates from 0 → 1 opacity on appear.
    ///
    /// # Usage
    /// ```swift
    /// Image("Logo")
    ///     .fadeInOnAppear(duration: 0.35, delay: 0.1)
    /// ```
    func fadeInOnAppear(duration: Double = 0.35, delay: Double = 0.0) -> some View {
        modifier(FadeInOnAppearModifier(duration: duration, delay: delay))
    }

    /// Fades the view out just before it disappears.
    ///
    /// - Parameters:
    ///   - duration: Animation duration.
    ///   - delay: Optional delay before starting.
    /// - Returns: A view that animates from 1 → 0 opacity on disappear.
    ///
    /// # Usage
    /// ```swift
    /// Text("Goodbye")
    ///     .fadeOutOnDisappear(duration: 0.25)
    /// ```
    func fadeOutOnDisappear(duration: Double = 0.25, delay: Double = 0.0) -> some View {
        modifier(FadeOutOnDisappearModifier(duration: duration, delay: delay))
    }

    /// Creates a pulsing fade (breathing) animation that repeats forever.
    ///
    /// - Parameters:
    ///   - min: Minimum opacity value during the pulse.
    ///   - max: Maximum opacity value during the pulse.
    ///   - duration: Duration of one pulse cycle (fade out + fade in).
    /// - Returns: A view with a repeating fade pulse.
    ///
    /// # Usage
    /// ```swift
    /// ProgressView()
    ///     .fadePulse(min: 0.35, max: 1.0, duration: 1.2)
    /// ```
    func fadePulse(min: Double = 0.35, max: Double = 1.0, duration: Double = 1.2) -> some View {
        modifier(FadePulseModifier(min: min, max: max, duration: duration))
    }

    /// Fades the view when disabled to indicate non-interactivity.
    ///
    /// - Parameters:
    ///   - isDisabled: Whether the view is disabled.
    ///   - disabledOpacity: Opacity to apply while disabled.
    ///   - duration: Animation duration.
    /// - Returns: A view that animates opacity when the disabled state changes.
    ///
    /// # Usage
    /// ```swift
    /// Button("Submit") { }
    ///     .fadeWhenDisabled(isDisabled: isLoading)
    ///     .disabled(isLoading)
    /// ```
    func fadeWhenDisabled(isDisabled: Bool, disabledOpacity: Double = 0.4, duration: Double = 0.2) -> some View {
        self
            .opacity(isDisabled ? disabledOpacity : 1.0)
            .animation(.easeInOut(duration: duration), value: isDisabled)
    }
}
struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
