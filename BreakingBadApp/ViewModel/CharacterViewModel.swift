//
//  CharacterViewModel.swift
//  BreakingBadApp
//
//  Created by Sylvain Remoue on 18/11/2022.
//

import Foundation

class CharacterViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    
    func fetchCharacters() {
        guard let url = URL(string: "https://breakingbadapi.com/api/characters") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let characters = try JSONDecoder().decode([Character].self, from: data)
                DispatchQueue.main.async {
                    self?.characters = characters
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
