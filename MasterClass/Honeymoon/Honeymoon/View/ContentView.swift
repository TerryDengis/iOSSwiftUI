//
//  ContentView.swift
//  Honeymoon
//
//  Created by Terry Dengis on 10/12/20.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var showBookingAlert: Bool = false
    @State private var showGuideView: Bool = false
    @State private var showInfoView: Bool = false
    @GestureState private var dragState = DragState.inactive
    @State private var lastCardIndex: Int = 1
    @State private var cardViews: [CardView] = {
        var views = [CardView] ()
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    } ()
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    
    private var dragAreaThreshold: CGFloat = 30
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging( let transition):
                return transition
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    private func moveCard () {
        cardViews.removeFirst()
        lastCardIndex += 1
        let destination = honeymoonData[lastCardIndex % honeymoonData.count]
        
        cardViews.append(CardView(honeymoon: destination))
    }
    
    private func isTopCard(_ cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    var body: some View {
        VStack {
            // MARK: - Header
            HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            
            Spacer()
            
            // MARK: - Cards
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(isTopCard(cardView) ? 1 : 0)
                        .overlay (
                            ZStack {
                                Image(systemName: "x.circle")
                                    .symbolModifier()
                                    .opacity(dragState.translation.width < -dragAreaThreshold && isTopCard(cardView) ? 1.0 : 0.0)
                                Image(systemName: "heart.circle")
                                    .symbolModifier()
                                    .opacity(dragState.translation.width > dragAreaThreshold && isTopCard(cardView) ? 1.0 : 0.0)
                            }
                        )
                        .offset (
                            x: isTopCard(cardView) ? dragState.translation.width : 0,
                            y: isTopCard(cardView) ? dragState.translation.height : 0)
                        .scaleEffect(dragState.isDragging && isTopCard(cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: Double(isTopCard(cardView) ? dragState.translation.width / 12 : 0)))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating($dragState) { value, state, transaction in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            }
                            .onChanged ( { value in
                                guard case .second(true, let drag?) = value else {
                                    return
                                }
                                if drag.translation.width < -dragAreaThreshold {
                                    cardRemovalTransition = .leadingBottom
                                } else {
                                    cardRemovalTransition = .trailingBottom
                                }
                            })
                            .onEnded ( { value in
                                guard case .second(true, let drag?) = value else {
                                        return
                                }
                                if drag.translation.width < -dragAreaThreshold || drag.translation.width > dragAreaThreshold {
                                    playSound("sound-rise", type: "mp3")
                                    moveCard()
                                }
                            })
                        )
                        .transition(cardRemovalTransition)
                }
            }
            .padding(.horizontal)
            Spacer()
            
            // MARK: - Footer
            FooterView(showBookingAlert: $showBookingAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
        } // VStack
        .alert(isPresented: $showBookingAlert) {
            Alert(title: Text("Success"), message: Text("Wishing you both a lovely and precious time together on you Honeymoon"), dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
