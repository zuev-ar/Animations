//
//  ContentView.swift
//  Animations
//
//  Created by Arkasha Zuev on 10.03.2021.
//

import SwiftUI

struct ContentView: View {
    var letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }
        .gesture(
            DragGesture()
                .onChanged({ (value) in
                    self.dragAmount = value.translation
                })
                .onEnded({ (_) in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                })
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
