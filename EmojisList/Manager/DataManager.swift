//
//  DataManager.swift
//  EmojisList-2
//
//  Created by Sergey Lukaschuk on 05.08.2021.
//

import UIKit

class DataManager {
    
    // Create an archive file
    var archiveURL: URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError() }
        return documentDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
    }
    
    // Decoding an object from an archive
    func loadAll() -> [Emoji]? {
        let decoder = PropertyListDecoder()
        guard let archiveURL = archiveURL else { fatalError() }
        guard let decoderEmojis = try? Data(contentsOf: archiveURL) else { fatalError() }
        return try? decoder.decode([Emoji].self, from: decoderEmojis)
    }
    
    // Encoder the received object into the archive file
    func saveEmojis(_ emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
        guard let archiveURL = archiveURL else { fatalError() }
        guard let encoderEmojis = try? encoder.encode(emojis) else { fatalError() }
        try? encoderEmojis.write(to: archiveURL, options: .noFileProtection)
    }
}
