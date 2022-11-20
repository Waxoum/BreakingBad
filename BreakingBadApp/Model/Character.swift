//
//  Character.swift
//  BreakingBadApp
//
//  Created by Sylvain Remoue on 18/11/2022.
//

import Foundation

struct Character: Hashable, Codable{
    let char_id: Int
    let name: String
    let nickname: String
    let status: String
    let portrayed: String
    let category: String
    let birthday:String
    let img: String?
    let occupation: [String]
    let appearance: [Int]
}
