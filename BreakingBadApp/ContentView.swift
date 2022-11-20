//
//  ContentView.swift
//  BreakingBadApp
//
//  Created by Sylvain Remoue on 18/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @StateObject var characterViewModel = CharacterViewModel()
    @State private var showingSheet = false
    
    init() {

        UINavigationBar.appearance().largeTitleTextAttributes = [.font : Custom().uIFontLargeTitleBad!]
            
        UINavigationBar.appearance().titleTextAttributes = [.font : Custom().uIFontTitleBad!]
        
       }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(characterViewModel.characters, id: \.self) { character in
                    NavigationLink {
                        DetailView(character: character)
                            
                    } label: {
                        HStack {
                            CircleAvatarView(urlStr: character.img)
                            Text(character.name)
                                .font(Custom().fontBodyAveria)
                                .foregroundColor(Custom().greenBad)
                        }
                    }
                }
            }
            .navigationBarTitle("Breaking Bad")
            .toolbar {
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: Custom().buttonQuote)
                        .font(.title2)
                }
                .sheet(isPresented: $showingSheet, content: {
                    PopularQuoteView()
                })
            }
            .onAppear {
                characterViewModel.fetchCharacters()
            }
        }.tint(Custom().greenBad)
        }

    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
