//
//  CharacterDetailViewController.swift
//  RNM Universe
//
//  Created by Sona Maria Jolly on 28/10/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialiseUI()
    }
    
    func initialiseUI() {
        self.navigationItem.largeTitleDisplayMode = .never
        if let character = self.character {
            self.title = character.name
            self.thumbnailImage.sd_setImage(with: URL(string: character.image), placeholderImage: UIImage(systemName: "person.crop.square"))
            self.nameLabel.text = character.name
            self.createdAtLabel.text = Helper.getDate(from: character.created)
            self.statusLabel.text = character.status.rawValue
            self.speciesLabel.text = character.species
            self.genderLabel.text = character.gender.rawValue
            self.locationLabel.text = character.location.name
            self.originLabel.text = character.origin.name
        }
    }
}

extension CharacterDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character?.episode.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as! EpisodeTableViewCell
        if let character = self.character {
            cell.configureCell(episode: character.episode[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()
        label.frame = CGRect.init(x: 16, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = "Episodes"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        headerView.backgroundColor = .systemIndigo
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }

}
