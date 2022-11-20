//
//  PopularQuoteView.swift
//  BreakingBadApp
//
//  Created by Sylvain Remoue on 19/11/2022.
//

import SwiftUI

struct PopularQuoteView: View {
    @StateObject var quoteViewModel = QuoteViewModel()
    var body: some View {
        VStack {
            Text("Most popular quote")
                .font(Custom().fontLargeTitleAveria)
                .padding()
            ScrollView {
                ForEach(quoteViewModel.quotes, id: \.self) { quote in
                    VStack {
                        Text(quote.author + " -")
                            .font(Custom().fontSubTitleAveria)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.vertical, 5.0)
                        Text("\"" + quote.quote + "\"")
                            .font(Custom().fontBodyAveria)
                            .padding(.horizontal)
                        Divider().padding()
                    }
                    
                }
            }
            .onAppear {
                quoteViewModel.fetchQuotes()
            }
        }
        
    }
}

struct PopularQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        PopularQuoteView()
    }
}
