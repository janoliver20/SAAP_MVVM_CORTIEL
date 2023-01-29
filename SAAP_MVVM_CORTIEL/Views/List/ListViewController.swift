//
//  ListViewController.swift
//  SAAP_MVVM_CORTIEL
//
//  Created by Jan Cortiel on 04.11.22.
//

import UIKit

class ListViewController: UIViewController {
   
    
    @IBOutlet var tableView: UITableView!

    @IBOutlet weak var searchBar: UISearchBar!
    
    private let carViewModel = CarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CarTableViewCell.nib, forCellReuseIdentifier: CarTableViewCell.identifier)

        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        carViewModel.delegate = self
        carViewModel.updateData()
    }
}

extension ListViewController: CarViewModelListener {
    func notifyUI() {
        Task{
            await MainActor.run(body: {
                tableView.reloadData()
            })
        }
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        carViewModel.searchFor(car: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        carViewModel.cancelSearch()
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carViewModel.sortedCars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CarTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell else {
            fatalError("xib does not exist")
        }
        
        cell.setCarIndex(with: carViewModel, index: indexPath.item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        if let detailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailsViewController.setViewModel(viewModel: carViewModel)
            detailsViewController.setCarIndex(index: indexPath.item)
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}
