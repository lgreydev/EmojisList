//
//  Emoji.swift
//  EmojisList-2
//
//  Created by Sergey Lukaschuk on 03.08.2021.
//

import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init() {
        symbol = ""
        name = ""
        description = ""
        usage = ""
    }
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}

extension Emoji {
    static var all = [
            Emoji(symbol: "😀", name: "Grinning Face", description: "A yellow face with simple, open eyes and a broad, open smile.", usage: "Not to be confused with 😃 Grinning Face With Big Eyes or 😄 Grinning Face With Smiling Eyes, which have the same smiles but more expressive eye shapes."),
        Emoji(symbol: "😉", name: "Winking Face", description: "A yellow face with a slight smile shown winking.", usage: "Not to be confused with the more mischievous or sexual 😏 Smirking Face. An emoji form of the ;) emoticon."),
        Emoji(symbol: "😍", name: "Smiling Face with Heart-Eyes", description: "A yellow face with an open smile, sometimes showing teeth, and red, cartoon-styled hearts for eyes.", usage: "This emoji has a cat variant, 😻 Smiling Cat Face With Heart-Eyes."),
        Emoji(symbol: "🤪", name: "Zany Face", description: "A smiley making a silly face.", usage: "Commonly represents such activities as acting goofy, having fun, and partying as well as various senses of slang terms like crazy, usually in a positive manner. May convey a spirit of wackiness more generally.")
        
        ]
    
    static func loadDefault() -> [Emoji] {
        return all
    }
}
