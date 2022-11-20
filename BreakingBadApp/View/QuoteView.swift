//
//  QuoteView.swift
//  BreakingBadApp
//
//  Created by Sylvain Remoue on 19/11/2022.
//

import SwiftUI

struct QuoteView: View {
    let character: Character
    @StateObject var quoteViewModel = QuoteViewModel()
    
    func catenateName()-> String{
            let fullNameArr = character.name.components(separatedBy: " ")
            let firstName = fullNameArr[0]
            let lastName = fullNameArr[1]
            return "\(firstName)+\(lastName)"
    }
    
    var body: some View {
        VStack {
            Text(character.nickname + " quote")
                .font(Custom().fontLargeTitleAveria)
                .padding()
            ScrollView {
                ForEach(quoteViewModel.quotes, id: \.self) { quote in
                    VStack {
                        Text(quote.quote)
                            .font(Custom().fontBodyAveria)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider().padding(.vertical)
                    }
                    .padding(.horizontal)
                }
            }
            .onAppear {
                quoteViewModel.fetchQuotesWithName(Name: catenateName())
            }
        }
        
    }
}
