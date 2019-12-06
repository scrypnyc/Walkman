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

class SearchViewController: UITableViewController {
    
    private var timer: Timer?
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let tracksArray = [TrackModel(trackName: "track name", artistName: "artist name"),
                       TrackModel(trackName: "track name 2", artistName: "artist name 2")]
    
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

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            let url = "https://itunes.apple.com/search?term=\(searchText)"
            
            AF.request(url).response { (dataResponse) in
                if let error = dataResponse.error {
                    print("Error data: \(error.localizedDescription)")
                    return
                }
                
                guard let data = dataResponse.data else { return }
                
                let decoder = JSONDecoder()
                do {
                    
                    let objects = try decoder.decode(SearchModel.self, from: data)
                    print("objects: ", objects)
                    
                } catch let jsonError {
                    print("Error to decode JSON", jsonError)
                }
                
                let someString = String(data: data, encoding: .utf8)
                print(someString ?? "")
            }
        })
        
        
    }
}
