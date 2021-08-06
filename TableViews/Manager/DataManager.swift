//
//  DataManager.swift
//  TableViews
//
//  Created by Sergey Lukaschuk on 05.08.2021.
//

import UIKit

class DataManager {
    
    var archiveURL: URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError() }
        return documentDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
    }
    
    func loadAll() -> [Emoji]? {
        print(#line, archiveURL ?? "nil")
//        let decoder = PropertyListDecoder()
//        if let decoderEmojes = try? decoder.decode([Emoji].self, from: encoderEmojis) {
//            decoderEmojes.forEach { print(#line, $0.symbol) }
//        }
        return nil
    }
    
    func saveEmojis(_ emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
        guard let encoderEmojis = try? encoder.encode(emojis) else { fatalError() }
        guard let archiveURL = archiveURL else { fatalError() }
        try? encoderEmojis.write(to: archiveURL, options: .noFileProtection)
    }
}
