//
//  EpisodeTableViewCell.swift
//  RNM Universe
//
//  Created by Sona Maria Jolly on 28/10/23.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeLabel: UILabel!
    private var episodeUrl: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(episode: String) {
        self.episodeUrl = episode
        if let episodeNumber = episode.components(separatedBy: "/").last {
            self.episodeLabel.text = "Episode \(episodeNumber)"
        }
    }

}
