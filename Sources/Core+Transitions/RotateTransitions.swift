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
