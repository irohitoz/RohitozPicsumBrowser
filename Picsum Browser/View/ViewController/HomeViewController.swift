//
//  HomeViewController.swift
//  Picsum Browser
//
//  Created by Hindavi Technologies on 03/08/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var picsumArray: [Picsum]? = []
    var picsumdataViewModel: PicsumDataViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.register(UINib(nibName: PicsumCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: PicsumCollectionViewCell.nibName)
        
        picsumdataViewModel = PicsumDataViewModel(repository: PicsumDataRepository())
        picsumdataViewModel?.getPicsumData(completionHandler: { [weak self] picsumData in
            DispatchQueue.main.async {
                self?.picsumArray = picsumData
                self?.collectionView.reloadData()
            }
        })
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picsumArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PicsumCollectionViewCell.nibName, for: indexPath) as? PicsumCollectionViewCell else {
             return UICollectionViewCell()
        }
        
        guard let picsumObject = picsumArray?[indexPath.row] else { return UICollectionViewCell() }
        cell.setupCollectionViewCell(with: picsumObject)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width/(collectionView.bounds.size.width/140), height: 200)
    }
}
