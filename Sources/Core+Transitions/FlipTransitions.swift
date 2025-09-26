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
            active: FlipModifier(angle: -90, axis: (x: 0, y: 1, z: 0), anchor: .leading),
            identity: FlipModifier(angle: 0, axis: (x: 0, y: 1, z: 0), anchor: .leading)
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
            active: FlipModifier(angle: 90, axis: (x: 0, y: 1, z: 0), anchor: .trailing),
            identity: FlipModifier(angle: 0, axis: (x: 0, y: 1, z: 0), anchor: .trailing)
        )
    }


    /// A flip transition that simulates a 3D flip effect from the top edge.
    ///
    /// - Returns: A transition that applies a vertical rotation combined with opacity for a flipping animation.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.flipFromTop)
    /// ```
    static var flipFromTop: AnyTransition {
        .modifier(
            active: FlipModifier(angle: -90, axis: (x: 1, y: 0, z: 0), anchor: .top),
            identity: FlipModifier(angle: 0, axis: (x: 1, y: 0, z: 0), anchor: .top)
        )
    }


    /// A flip transition that simulates a 3D flip effect from the bottom edge.
    ///
    /// - Returns: A transition that applies a vertical rotation combined with opacity for a flipping animation.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.flipFromBottom)
    /// ```
    static var flipFromBottom: AnyTransition {
        .modifier(
            active: FlipModifier(angle: 90, axis: (x: 1, y: 0, z: 0), anchor: .bottom),
            identity: FlipModifier(angle: 0, axis: (x: 1, y: 0, z: 0), anchor: .bottom)
        )
    }


    /// A flip transition that simulates a 3D flip effect from the center.
    ///
    /// - Returns: A transition that applies a rotation around the Y-axis from the center anchor.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.flipFromCenter)
    /// ```
    static var flipFromCenter: AnyTransition {
        .modifier(
            active: FlipModifier(angle: 180, axis: (x: 0, y: 1, z: 0), anchor: .center),
            identity: FlipModifier(angle: 0, axis: (x: 0, y: 1, z: 0), anchor: .center)
        )
    }

    
    /// A flip transition that performs a full 360-degree rotation around the Y-axis.
    ///
    /// - Returns: A transition that applies a full spin with opacity from the center.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.flipFullRotation)
    /// ```
    static var flipFullRotation: AnyTransition {
        .modifier(
            active: FlipModifier(angle: 360, axis: (x: 0, y: 1, z: 0), anchor: .center),
            identity: FlipModifier(angle: 0, axis: (x: 0, y: 1, z: 0), anchor: .center)
        )
    }

    
    /// A flip transition that rotates diagonally from the top-leading corner.
    ///
    /// - Returns: A transition that flips diagonally from the top-leading edge with 3D effect.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.flipFromTopLeading)
    /// ```
    static var flipFromTopLeading: AnyTransition {
        .modifier(
            active: FlipModifier(angle: -90, axis: (x: 1, y: 1, z: 0), anchor: .topLeading),
            identity: FlipModifier(angle: 0, axis: (x: 1, y: 1, z: 0), anchor: .topLeading)
        )
    }
}

private struct FlipModifier: ViewModifier {
    let angle: Double
    let axis: (x: CGFloat, y: CGFloat, z: CGFloat)
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotation3DEffect(
                .degrees(angle),
                axis: axis,
                anchor: anchor,
                perspective: 0.5
            )
            .opacity(angle == 0 ? 1 : 0)
    }
}
