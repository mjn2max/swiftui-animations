//
// RotateTransitions.swift
// SwiftUI-Animations
//
// Created by Huy D. on 6/26/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// CodePassion.dev
//

import SwiftUI

import SwiftUI

extension AnyTransition {
    /// A rotation transition that rotates the view in from the top-left corner.
    ///
    /// - Returns: A transition applying a 90-degree rotation with fade from the top-left.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.rotateFromTopLeading)
    /// ```
    static var rotateFromTopLeading: AnyTransition {
        .modifier(
            active: RotateModifier(angle: -90, anchor: .topLeading),
            identity: RotateModifier(angle: 0, anchor: .topLeading)
        )
    }


    /// A rotation transition that rotates the view in from the bottom-right corner.
    ///
    /// - Returns: A transition applying a -90-degree rotation with fade from the bottom-right.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.rotateFromBottomTrailing)
    /// ```
    static var rotateFromBottomTrailing: AnyTransition {
        .modifier(
            active: RotateModifier(angle: -90, anchor: .bottomTrailing),
            identity: RotateModifier(angle: 0, anchor: .bottomTrailing)
        )
    }

    
    private struct RotateModifier: ViewModifier {
        let angle: Double
        let anchor: UnitPoint

        func body(content: Content) -> some View {
            content
                .rotationEffect(.degrees(angle), anchor: anchor)
                .opacity(angle == 0 ? 1 : 0)
        }
    }
}
