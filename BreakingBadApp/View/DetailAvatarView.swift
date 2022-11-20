//
//  DetailAvatarView.swift
//  BreakingBadApp
//
//  Created by Sylvain Remoue on 18/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailAvatarView: View {
    var urlStr: String?
    
    var body: some View {
        if let urlString = urlStr, let url = URL(string: urlString) {
            WebImage(url: url)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .background(Color.gray)
        }
    }
}
