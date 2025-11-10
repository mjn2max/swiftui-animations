//
// BounceAnimations.swift
// SwiftUI-Animations
//
// Created by Huy D. on 6/26/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// CodePassion.dev
//

import SwiftUI

// MARK: - Bounce Animations

public extension View {
}

// MARK: - Private Modifiers

/// A core modifier that performs the bounce scale animation.
///
/// This modifier drives the scale effect from a peak value back to `1.0`
/// using an interactive spring. It listens to a `trigger` value to restart
/// the animation on demand.
///
/// - Parameters:
///   - trigger: A binding that, when changed, restarts the bounce animation.
///   - peakScale: The maximum scale reached at the start of the bounce.
///   - duration: The spring response (approximate duration) in seconds.
///   - damping: The spring damping fraction; lower values bounce more.
///   - blendDuration: The spring blend duration.
private struct BounceModifier: ViewModifier {
    @Binding var trigger: UUID

    let peakScale: CGFloat
    let duration: CGFloat
    let damping: CGFloat
    let blendDuration: CGFloat

    @State private var isBouncing = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(isBouncing ? 1.0 : peakScale)
            .animation(
                .interactiveSpring(
                    response: duration,
                    dampingFraction: damping,
                    blendDuration: blendDuration
                ),
                value: isBouncing
            )
            .onChange(of: trigger) { _ in
                // Start at peak, then settle back to 1.0
                isBouncing = false
                // Ensure the state change propagates to trigger animation
                DispatchQueue.main.async {
                    isBouncing = true
                }
            }
            .onAppear {
                // Initialize settled state
                isBouncing = true
            }
    }
}

/// A convenience modifier that triggers a bounce when the view appears.
///
/// Internally, this creates and updates a `trigger` value on `onAppear` to
/// restart the underlying `BounceModifier` animation.
///
/// - Parameters:
///   - peakScale: The maximum scale reached at the start of the bounce.
///   - duration: The spring response (approximate duration) in seconds.
///   - damping: The spring damping fraction; lower values bounce more.
///   - blendDuration: The spring blend duration.
private struct BounceOnAppearModifier: ViewModifier {
    let peakScale: CGFloat
    let duration: CGFloat
    let damping: CGFloat
    let blendDuration: CGFloat

    @State private var trigger = UUID()

    func body(content: Content) -> some View {
        content
            .modifier(BounceModifier(
                trigger: $trigger,
                peakScale: peakScale,
                duration: duration,
                damping: damping,
                blendDuration: blendDuration
            ))
            .onAppear {
                trigger = UUID()
            }
    }
}
