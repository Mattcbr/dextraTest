//
//  PeopleTableViewController.swift
//  dextraTest
//
//  Created by Matheus Queiroz on 4/18/18.
//  Copyright © 2018 mattcbr. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class PeopleTableViewController: UITableViewController, RequestDelegate {
    
    var peopleArray: [People]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    //Setting up the search
    let searchController = UISearchController(searchResultsController: nil)
    var filteredPeople = [People]()
    
    let r = Request()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar Usuários"
        navigationItem.searchController = searchController
        definesPresentationContext = true

        r.delegate = self
        r.requestInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Search bar functions
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredPeople = (peopleArray?.filter({( person : People) -> Bool in
            return person.name.lowercased().contains(searchText.lowercased())
        }))!
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredPeople.count
        }
        return peopleArray?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PersonTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PersonTableViewCell else {
            fatalError("Not person table view cell")
        }
        
        let person: People
        if isFiltering(){
            person = filteredPeople[indexPath.row]
        } else {
            person = (peopleArray?[indexPath.row])!
        }
        cell.personNameLabel.text = person.name
        let repoText: String
        
        //Personalizing the repository count label
        if (person.repoCount == 0){
            repoText = "Usuário sem repositórios"
        } else if (person.repoCount == 1) {
            repoText = "1 repositório"
        } else {
            repoText = "\((person.repoCount)) repositórios"
        }
        
        cell.repoCountLabel.text = repoText
        
        //Loading images
        Alamofire.request((person.thumbnailPath)).responseImage { response in
            print("\nImage Request Response:\n\(response)")
            
            if let image = response.result.value {
                cell.personImage.image = image
            }
        }
        
        return cell
    }

    func didLoadPeople(people: [People]){
            peopleArray = people
    }
    
    // MARK: - Error Handling
    func didFailToLoadPeople(withError error: Error){
        
        let alert = UIAlertController(title: "Erro ao carregar usuários", message: "\(error)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Voltar", comment: "Default action"), style: .default, handler: { _ in
            print("Error \(error)")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var selectedIndexPath = self.tableView.indexPathForSelectedRow
        let destination = segue.destination as! DetailTableViewController
        
        let selectedPerson: People = peopleArray![(selectedIndexPath?.row)!]
        
        destination.person = selectedPerson
    }
}

extension PeopleTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
