//
//  MovieListViewController.swift
//  Zonezero
//
//  Created by yakup caglan on 8.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit

class MovieListViewController: LayoutableViewController  {
    
    typealias ViewType = MovieListView
    
    override func loadView() {
        super.loadView()
        
        view = ViewType.create()
        
        layoutableView.collectionView.delegate = self
        layoutableView.collectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie List"
        
        navigationItem.hidesBackButton = true
        
        
            let item = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logout))

            navigationItem.rightBarButtonItem = item
        }
        
        @objc func logout() {
            navigationController?.popViewController(animated: true)
            
        }
    
}

extension MovieListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, Alertable {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Movies.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MovieCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.titleLabel.text = "\(Movies.allCases[indexPath.row].rawValue)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width - 32, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let okeyAction = UIAlertAction(title: "Okay", style: .default)
        self.showAlert(title: "Movie", message: "Selected movie is \(Movies.allCases[indexPath.row].rawValue)", alertActions: okeyAction)
    }
    
    
}
