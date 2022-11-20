//
//  URLImage.swift
//  BreakingBadApp
//
//  Created by Sylvain Remoue on 18/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CircleAvatarView: View {
    var urlStr: String?
    
    var body: some View {
        if let urlString = urlStr, let url = URL(string: urlString) {
            WebImage(url: url)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
        } else {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.gray)
                .clipShape(Circle())
        }
    }
}
