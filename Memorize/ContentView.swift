//
//  ContentView.swift
//  Memorize
//
//  Created by HelloAlpacaa on 3/29/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🦄", "🐇", "🐰", "🦎", "🐻", "🐼", "🦁", "🐨"]
     
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack (alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                    .foregroundColor(.orange)
                Text(content)
                    .font(.largeTitle)
            } else {
                base
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
