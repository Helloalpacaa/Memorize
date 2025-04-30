//
//  ContentView.swift
//  Memorize
//
//  Created by HelloAlpacaa on 3/29/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🦄", "🐇", "🐰", "🦎", "🐻", "🐼", "🦁", "🐨"]
    @State var cardCounters: Int = 4
     
    var body: some View {
        VStack {
            cards
            cardCountersAdjusters
        }
        .padding()
    }
    
    var cardCountersAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCounters += offset
        }, label: {
            Image(systemName:symbol)
        })
        .disabled(cardCounters + offset < 1 || cardCounters + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCounters, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
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
