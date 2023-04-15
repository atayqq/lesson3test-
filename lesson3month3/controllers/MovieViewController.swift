//
//  MovieViewController.swift
//  lesson3month3
//
//  Created by atay on 15/4/23.
//

import UIKit

class MovieViewController: UIViewController {
    
    private let cellId = "cell"
    private var movieList: [Movie] = []
    

    @IBOutlet weak var MovieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initData()
    }
    
    private func initUI(){
        MovieTableView.dataSource = self
        MovieTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        MovieTableView.delegate = self
    }
    private func initData(){
        movieList = [
            Movie(image: "1", name: "Movie 1", description: "Movie 1 desk"),
            Movie(image: "1", name: "Movie 2", description: "Movie 2 desk"),
            Movie(image: "1", name: "Movie 3", description: "Movie 3 desk")
            ]
    }
    
}
extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell1 = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//        cell.textLabel?.text = "cell \(indexPath.row)"
//        cell.imageView?.image = UIImage(systemName: "person")
//        cell.detailTextLabel?.text = "it is detail label"
//        cell.accessoryType = .disclosureIndicator
//        return cell1
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell2.textLabel?.text = movieList[indexPath.row].name
        cell2.imageView?.image = UIImage(named: movieList[indexPath.row].image)
        return cell2
    }
}
extension MovieViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("download this movie")
        
        let vc =
        self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.movie = movieList[indexPath.row]
    }
}

struct Movie {
    var image: String
    var name: String
    var description: String
}
