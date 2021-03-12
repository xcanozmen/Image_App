//
//  HomeImageCell.swift
//  Image_App
//
//  Created by Can on 10.03.2021.
//

import UIKit
import Kingfisher

class HomeImageCell: UICollectionViewCell {

    //IBOutlets
    @IBOutlet weak var homeImgView: UIImageView!
    @IBOutlet weak var homeWightHeighLbl: UILabel!
    @IBOutlet weak var homeSizeLbl: UILabel!
    @IBOutlet weak var homeTypeLbl: UILabel!
    
    //Properties
    private var storageManager = StorageManager.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
        
    func setupView(hit: Hit) {
        homeWightHeighLbl.text = "\(hit.imageHeight) x \(hit.imageWidth)"
        
        let bytesToMb = Units(bytes: hit.imageSize).getStringFromUnits()
        homeSizeLbl.text = bytesToMb
        
        if let url = URL(string: hit.largeImageURL) {
            let fileExtension = url.pathExtension.uppercased()
            homeTypeLbl.text = fileExtension
            
            let placeholder = UIImage(named: AppImages.Placeholder)
            let options: KingfisherOptionsInfo = [.transition(.fade(0.2)),
                                                  .processor(DownsamplingImageProcessor(size: homeImgView.frame.size)),
                                                  .scaleFactor(UIScreen.main.scale),
                                                  .cacheOriginalImage]
            homeImgView.kf.indicatorType = .activity
            homeImgView.kf.setImage(with: url, placeholder: placeholder, options: options) { (_) in
                if hit.date == nil {
                    self.storageManager.saveDowloadingDate(hit)
                }
            }
        }
    }

}

