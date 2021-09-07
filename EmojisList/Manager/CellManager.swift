//
//  CellManager.swift
//  EmojisList-2
//
//  Created by Sergey Lukaschuk on 03.08.2021.
//

import UIKit

class CellManager {
    func configure(_ cell: EmojiTableViewCell, with emoji: Emoji) {
        cell.emojiLabel?.text = emoji.symbol
        cell.titleLabel?.text = emoji.name
        cell.descriptionLabel.text = emoji.description
    }
}
