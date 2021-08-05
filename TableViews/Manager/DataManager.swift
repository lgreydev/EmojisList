//
//  DataManager.swift
//  TableViews
//
//  Created by Sergey Lukaschuk on 05.08.2021.
//

import UIKit

class DataManager {
    
    
    let encoder = PropertyListEncoder()
    let decoder = PropertyListDecoder()
    
//    if let encoderEmojis = try? encoder.encode(emojis) {
//        print(#line, encoderEmojis)
//        
//        if let decoderEmojes = try? decoder.decode([Emoji].self, from: encoderEmojis) {
//            decoderEmojes.forEach { print(#line, $0.symbol) }
//        }
//    }
    
    func loadAll() -> [Emoji]? {
        return nil
    }
}
