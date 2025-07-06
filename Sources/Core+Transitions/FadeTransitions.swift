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
    /// A fade-in and fade-out transition.
    ///
    /// - Returns: A transition that smoothly changes opacity.
    ///
    /// # Usage
    /// ```
    /// .transition(.fade)
    /// ```
    static var fade: AnyTransition {
        .opacity
    }


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


    /// A fade-and-slide transition that moves the view in/out from the leading edge while fading.
    ///
    /// - Returns: A transition that combines fading with horizontal movement from the leading edge.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeSlideLeading)
    /// ```
    static var fadeSlideLeading: AnyTransition {
        .opacity.combined(with: .move(edge: .leading))
    }


    /// A fade-and-slide transition that moves the view in/out from the trailing edge while fading.
    ///
    /// - Returns: A transition that combines fading with horizontal movement from the trailing edge.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeSlideTrailing)
    /// ```
    static var fadeSlideTrailing: AnyTransition {
        .opacity.combined(with: .move(edge: .trailing))
    }


    /// A fade-and-move transition that fades in/out while moving from the bottom.
    ///
    /// - Returns: A transition combining opacity and offset from bottom.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeMoveUp)
    /// ```
    static var fadeMoveUp: AnyTransition {
        .opacity.combined(with: .move(edge: .bottom))
    }
}
