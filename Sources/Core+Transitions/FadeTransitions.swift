//
// FadeTransitions.swift
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
    /// A smooth fade-and-scale transition combining opacity and scale effects.
    ///
    /// - Returns: A transition that fades and slightly scales the view for a polished animation.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeAndScale)
    /// ```
    static var fadeAndScale: AnyTransition {
        .opacity.combined(with: .scale(scale: 0.95, anchor: .center))
    }
}
