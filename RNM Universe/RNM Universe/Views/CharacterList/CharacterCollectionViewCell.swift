//
//  CharacterCollectionViewCell.swift
//  RNM Universe
//
//  Created by Sona Maria Jolly on 28/10/23.
//

import UIKit
import SDWebImage

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImage.layer.cornerRadius = 6.0
    }
    
    func configureCell(_ character: Character) {
        self.titleLabel.text = character.name
        self.thumbnailImage.sd_setImage(with: URL(string: character.image), placeholderImage: UIImage(systemName: "person.crop.square"))
    }
}
