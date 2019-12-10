//
//  SearchViewController.swift
//  Walkman
//
//  Created by Alexander Skrypnyk on 18.11.2019.
//  Copyright © 2019 Alexander Skrypnyk. All rights reserved.
//

import UIKit
import Alamofire


struct TrackModel {
    var trackName: String
    var artistName: String
}

class SearchLibraryViewController: UITableViewController {
    
    var networkService = NetworkService()
    private var timer: Timer?
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var tracksArray = [Track]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSearchBar()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracksArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let track = tracksArray[indexPath.row]
        cell.textLabel?.text = "\(track.trackName) \n \(track.artistName)"
        cell.textLabel?.numberOfLines = 2
        cell.imageView?.image = #imageLiteral(resourceName: "MGMT_Cover_Art")
        
        return cell
    }

}

extension SearchLibraryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            // Утечка памяти, сильная ссылка networkService, повторение цикла без освобождения памяти
            // решение [weak self] перед получаемым парамметром
            self.networkService.fetchTracks(searchText: searchText) { [weak self] (searchResults) in
                self?.tracksArray = searchResults?.results ?? []
                self?.tableView.reloadData()
            }

        })
    }
}
