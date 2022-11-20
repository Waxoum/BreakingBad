//
//  QuoteViewModel.swift
//  BreakingBadApp
//
//  Created by Sylvain Remoue on 19/11/2022.
//

import Foundation

class QuoteViewModel: ObservableObject {
    
    @Published var quotes: [Quote] = []
    
    func fetchQuotes() {
        guard let url = URL(string: "https://breakingbadapi.com/api/quotes") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let quotes = try JSONDecoder().decode([Quote].self, from: data)
                DispatchQueue.main.async {
                    self?.quotes = quotes
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
    func fetchQuotesWithName(Name: String) {
        guard let url = URL(string: "https://breakingbadapi.com/api/quote?author=\(Name)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let quotes = try JSONDecoder().decode([Quote].self, from: data)
                DispatchQueue.main.async {
                    self?.quotes = quotes
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
