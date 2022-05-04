//
//  WithBinding.swift
//
//  Created by Brandon Erbschloe on 04/29/22.

import SwiftUI

/// Store a (writable) binding transferred to underlying content
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct WithBinding<T, Content: View>: View {
    
    @State private var data: T
    private let content: (Binding<T>) -> Content

    public init(for data: T, @ViewBuilder content: @escaping (Binding<T>) -> Content) {
        _data = State(initialValue: data)
        self.content = content
    }

    public var body: some View {
      content($data)
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension WithBinding {
    
    public init<A, B>(
        for a: A, _ b: B,
        @ViewBuilder content: @escaping (Binding<A>, Binding<B>) -> Content
    ) where T == (A, B) {
        self.init(for: (a, b)) {
            content(
                $0[dynamicMember: \.0],
                $0[dynamicMember: \.1]
            )
        }
    }
    
    public init<A, B, C>(
        for a: A, _ b: B, _ c: C,
        @ViewBuilder content: @escaping (Binding<A>, Binding<B>, Binding<C>) -> Content
    ) where T == (A, B, C) {
        self.init(for: (a, b, c)) {
            content(
                $0[dynamicMember: \.0],
                $0[dynamicMember: \.1],
                $0[dynamicMember: \.2]
            )
        }
    }
    
    public init<A, B, C, D>(
        for a: A, _ b: B, _ c: C, _ d: D,
        @ViewBuilder content: @escaping (Binding<A>, Binding<B>, Binding<C>, Binding<D>) -> Content
    ) where T == (A, B, C, D) {
        self.init(for: (a, b, c, d)) {
            content(
                $0[dynamicMember: \.0],
                $0[dynamicMember: \.1],
                $0[dynamicMember: \.2],
                $0[dynamicMember: \.3]
            )
        }
    }
    
    public init<A, B, C, D, E>(
        for a: A, _ b: B, _ c: C, _ d: D, _ e: E,
        @ViewBuilder content: @escaping (Binding<A>, Binding<B>, Binding<C>, Binding<D>, Binding<E>) -> Content
    ) where T == (A, B, C, D, E) {
        self.init(for: (a, b, c, d, e)) {
            content(
                $0[dynamicMember: \.0],
                $0[dynamicMember: \.1],
                $0[dynamicMember: \.2],
                $0[dynamicMember: \.3],
                $0[dynamicMember: \.4]
            )
        }
    }
}
