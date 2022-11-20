//
//  PresentationView.swift
//  BreakingBadApp
//
//  Created by Sylvain Remoue on 19/11/2022.
//

import SwiftUI

struct PresentationView: View {
    let character: Character
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            HStack {
                Text(character.name)
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: Custom().buttonQuote)
                        .font(.largeTitle)
                }
                .sheet(isPresented: $showingSheet, content: {
                    QuoteView(character: character)
                })
                .buttonStyle(.plain)
            }.padding(.horizontal, 8)
            Text(character.nickname)
                .font(.title)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 8)
            Divider().padding()
            HStack {
                Text("Status :")
                    .bold()
                Text(character.status)
                Spacer()
            }.padding([.leading, .bottom, .trailing], 8)
            HStack {
                Text("Portrayed :")
                    .bold()
                Text(character.portrayed)
                Spacer()
            }.padding([.leading, .bottom, .trailing], 8)
            HStack {
                Text("Birthday :")
                    .bold()
                Text(character.birthday)
                Spacer()
            }.padding([.leading, .bottom, .trailing], 8)
            
            HStack {
                Text("Occupation :")
                    .bold()
                VStack {
                    ForEach(character.occupation, id: \.self) { occupation in
                        Text(occupation)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                Spacer()
            }.padding([.leading, .bottom, .trailing], 8)
            Spacer()
            HStack {
                Text("Appearance :")
                    .foregroundColor(.secondary)
                    .bold()
                ForEach(character.appearance, id: \.self) { appearance in
                    Text(String(appearance))
                        .foregroundColor(.secondary)
                }
                Spacer()
            }.padding([.leading, .bottom, .trailing], 8)
            

        }
        .background(Color.accentColor.opacity(0.5))
        .cornerRadius(20)
    }
}

