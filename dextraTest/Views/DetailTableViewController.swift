//
//  DetailTableViewController.swift
//  dextraTest
//
//  Created by Matheus Queiroz on 4/19/18.
//  Copyright © 2018 mattcbr. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var person = People(id: 0, name: "", thumbPath: "", repoCount: 0, repos: [Repositories]()) {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if person.repoCount == 0 {
            showAlert()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        if person.repoCount == 0 {
            showAlert()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.repoCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DetailTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DetailTableViewCell else {
            fatalError("Not detail table view cell")
        }
        cell.repoNameLabel.text = person.repositories[indexPath.row].name
        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var selectedIndexPath = self.tableView.indexPathForSelectedRow
        let destination = segue.destination as! AvailabilityViewController
        
        let selectedRepo: Repositories = person.repositories[selectedIndexPath!.row]
        
        destination.repo = selectedRepo
    }
    
    @IBAction func showAlert(){
        let alert = UIAlertController(title: "Usuário sem repositórios", message: "O usuário selecionado não possui repositórios", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Voltar", comment: "Default action"), style: .default, handler: { _ in
            _ = self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
