//
//  HomeViewController.swift
//  Cartoons2D
//
//  Created by Amr Hassan on 28/11/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let netWorkManager = NetworkManager()
    
    private var data: HomeDataModel?{
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: HomeTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
    }
    
    func getData() {
        netWorkManager.getData { (result) in
            switch result {
            case .success(let data):
                self.data = data
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as! HomeTableViewCell
        let fetchedData = data?[indexPath.row]
        cell.configure(data: fetchedData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fetchedData = data?[indexPath.row]
        if let fetchedData = fetchedData {
            let alert = UIAlertController(title: fetchedData.title, message: "ID: \(fetchedData.id!)\n Year: \(fetchedData.year!)\n Duration: \(fetchedData.runtimeInMinutes!) minutes", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
