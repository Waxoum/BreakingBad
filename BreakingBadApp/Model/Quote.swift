//
//  Quote.swift
//  BreakingBadApp
//
//  Created by Sylvain Remoue on 18/11/2022.
//

import Foundation

struct Quote: Hashable, Codable{
    let quote_id: Int
    let quote: String
    let author:String
}
