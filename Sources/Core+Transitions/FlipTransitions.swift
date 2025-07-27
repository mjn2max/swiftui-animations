//
// FlipTransitions.swift
// SwiftUI-Animations
//
// Created by Huy D. on 6/26/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// CodePassion.dev
//

import SwiftUI

extension AnyTransition {
    /// A flip transition that simulates a 3D flip effect from the leading edge.
    ///
    /// - Returns: A transition that applies a rotation combined with opacity for a flipping animation.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.flipFromLeading)
    /// ```
    static var flipFromLeading: AnyTransition {
        .modifier(
            active: FlipModifier(angle: -90, anchor: .leading),
            identity: FlipModifier(angle: 0, anchor: .leading)
        )
    }

    
    /// A flip transition that simulates a 3D flip effect from the trailing edge.
    ///
    /// - Returns: A transition that applies a rotation combined with opacity for a trailing-edge flip animation.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.flipFromTrailing)
    /// ```
    static var flipFromTrailing: AnyTransition {
        .modifier(
            active: FlipModifier(angle: 90, anchor: .trailing),
            identity: FlipModifier(angle: 0, anchor: .trailing)
        )
    }
}

private struct FlipModifier: ViewModifier {
    let angle: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotation3DEffect(
                .degrees(angle),
                axis: (x: 0, y: 1, z: 0),
                anchor: anchor,
                perspective: 0.5
            )
            .opacity(angle == 0 ? 1 : 0)
    }
}
