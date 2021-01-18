//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Will on 12/27/20.
//
// this is the VIEW

import SwiftUI

struct emojiMemoryGameView: View {
    @ObservedObject var viewModel: emojiMemoryGame
    
    var body: some View {
        // MARK: - Drawing Constants
        let cornerRadius: CGFloat = 10.0
        let score = viewModel.score
        let theme = viewModel.theme.name
        
        VStack {
            Text("\(theme)").padding(.top).font(Font.title2)
            
            Grid(items: viewModel.cards) { card in
                CardView(card: card, gradient: Gradient(colors: [viewModel.theme.primaryColor, viewModel.theme.accentColor])).onTapGesture {
                    withAnimation(.linear(duration: cardDuration)) {
                        viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
            .padding()
            
            Text("Score: \(score)").padding().font(Font.largeTitle)
            
            Button(action: {
                withAnimation(.easeInOut) {
                    viewModel.resetGame()
                }
                
            }, label: {Text("New Game")})
                .foregroundColor(.black)
                .padding(.horizontal, 50)
                .padding(.vertical, 15)
                .background(RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(gradient: Gradient(colors: [viewModel.theme.primaryColor, viewModel.theme.accentColor]), startPoint: .top, endPoint: .bottom)))
        }
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    let gradient: Gradient
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    var body: some View {
        GeometryReader { geometry in
            if card.isFaceUp || !card.isMatched {
                ZStack {
                    Group {
                        if card.isConsumingBonusTime {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                                .onAppear() {
                                    self.startBonusTimeAnimation()
                                }
                        } else {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                        }
                    }
                    .padding(5).opacity(0.4)
                    .transition(.identity)
                    Text(card.content)
                        .font(Font.system(size: fontSize(for: geometry.size)))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear(duration: spinDuration).repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp, gradient: gradient)
                .transition(AnyTransition.scale)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = emojiMemoryGame()
        game.choose(card: game.cards[0])
        return emojiMemoryGameView(viewModel: game)
    }
}

// MARK: - Drawing Constants

private let fontScaleFactor: CGFloat = 0.70
private let cardDuration = 0.50
private let spinDuration = 1.0

func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * fontScaleFactor
}
