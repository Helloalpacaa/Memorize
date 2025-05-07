//
//  ContentView.swift
//  Memorize
//
//  Created by HelloAlpacaa on 3/29/25.
//

import SwiftUI

struct ContentView: View {
    let animals: [String] = ["🦄", "🐇", "🐰", "🦎", "🐻", "🐼", "🦁", "🐨"]
    let vehicles: [String] = ["🚗", "🚀", "🚁", "🚃", "🚄", "🚅", "🚆", "🚇"]
    let faces: [String] = ["😂", "😁","😎", "😈", "😊", "😋", "😌", "😐", "😑", "😒", "😓", "😔", "😕", "😖", "😘", "🤡"]
    @State var selectedCards: [String] = []
     
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            cards
            Spacer()
            
            HStack {
                buttonWithIcon("car", title: "Vehicles", emojiSets: self.vehicles)
                
                buttonWithIcon("pawprint", title: "Animals", emojiSets: self.animals)
                
                buttonWithIcon("face.smiling", title: "Emojis", emojiSets: self.faces)
                
            }
        }
        .padding()
    }
    
    func buttonWithIcon(_ systemname: String, title: String, emojiSets: [String]) -> some View {
        Button {
            selectedCards = (emojiSets + emojiSets).shuffled()
        } label: {
            VStack {
                Image(systemName: systemname)
                    .font(.title)
                Text(title).font(.caption)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var cards: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 100))]) {
                ForEach(0..<selectedCards.count, id: \.self) { index in
                    CardView(content: selectedCards[index])
                }
            }
            .foregroundColor(.orange)
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
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
        }
        .frame(width: 70, height: 100)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
