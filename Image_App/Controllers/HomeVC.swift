//
//  HomeVC.swift
//  Image_App
//
//  Created by Can on 10.03.2021.
//

import UIKit
import RealmSwift

class HomeVC: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Properties
    private var hits: Results<Hit>!
    private var hitToPass: Hit!
    private var serviceResponseAPI = ServiceResponseAPI.shared
    private var storageManager = StorageManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(path)
        print("asacscs")
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        hits = realm.objects(Hit.self)
        loadHits(1)
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: XibNames.HomeImageCell, bundle: nil),
                                forCellWithReuseIdentifier: Identifiers.HomeImageCell)
    }
    
    private func loadHits(_ page: Int) {
        serviceResponseAPI.getImages(page: page) { (response) in
            guard let response = response else { return }
            self.storageManager.saveImages(response)
            self.collectionView.reloadData()
        }
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.HomeImageCell, for: indexPath) as? HomeImageCell {
            let recordings = hits[indexPath.item]
            cell.setupView(hit: recordings)
            
            if PageCounter.hasMorePages, indexPath.item == hits.count - 1 {
                loadHits(PageCounter.nextPage)
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let cellWidth = (width - 12) / 2
        let cellHeight = cellWidth + 76

        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        hitToPass = hits[indexPath.item]
        performSegue(withIdentifier: Segues.ToDetailImageVC, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.ToDetailImageVC {
            if let vc = segue.destination as? DetailVC {
                vc.hit = hitToPass
            }
        }
    }
}
