//
//  CharacterViewController.swift
//  RNM Universe
//
//  Created by Sona Maria Jolly on 28/10/23.
//

import UIKit

class CharacterViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var isListView: Bool = true
    private var viewModel: CharacterViewModel!
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialiseViewModel()
        self.addRefreshControl()
    }
    
    func initialiseViewModel(){
        viewModel = CharacterViewModel()
        viewModel.requestCharacters()
        viewModel.reloadCollectionView = {
            self.reloadCollectionView()
        }
        viewModel.showError = { [weak self] message in
            self?.showErrorAlert(message: message)
        }
        viewModel.showLoading = {
            DispatchQueue.main.async { self.activityIndicator.startAnimating() }
        }
        viewModel.hideLoading = {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.refreshControl.endRefreshing()
            }
        }
        viewModel.navigateToDetail = { [weak self] character in
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let characterDetailVC = storyboard.instantiateViewController(identifier: "CharacterDetailViewController") as! CharacterDetailViewController
            characterDetailVC.character = character
            self?.navigationController?.pushViewController(characterDetailVC, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showErrorAlert(message: String) {
        DispatchQueue.main.async {
            self.showAlert(title: "Network Error", message: message) {
                self.viewModel.requestCharacters()
            }
        }
    }
    
    //Add pull to refresh so that user can refresh data whenever needed.
    func addRefreshControl() {
        collectionView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    
    // Pull to refresh action
    @objc func refreshData(_ sender: UIRefreshControl) {
        self.viewModel.requestCharacters()
    }
    
}

//MARK:- CollectionView Delegate & CollectionView Datasource
extension CharacterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfCharacters()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath) as! CharacterCollectionViewCell
        cell.configureCell(self.viewModel.character(at: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCharacter = self.viewModel.character(at: indexPath.row)
        self.viewModel.navigateToDetail?(selectedCharacter)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.numberOfCharacters()-1  {
                viewModel.loadNextBatchIfNeeded(for: indexPath)
        }
    }
}
