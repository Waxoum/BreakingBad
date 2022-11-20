//
//  DetailView.swift
//  BreakingBadApp
//
//  Created by Sylvain Remoue on 18/11/2022.
//

import SwiftUI

struct DetailView: View {
    
    let character: Character
    
    var body: some View {
        VStack {
            Spacer()
            PresentationView(character: character)
        }.background(
            DetailAvatarView(urlStr: character.img)
                .ignoresSafeArea(.all)
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(character: Character(char_id: 1, name: "Sylvain", nickname: "nickname", status: "Alive", portrayed: "potrayed", category: "category", birthday: "birthday", img: "", occupation: ["Dev","Dev"], appearance: [1,2,3]))
    }
}
