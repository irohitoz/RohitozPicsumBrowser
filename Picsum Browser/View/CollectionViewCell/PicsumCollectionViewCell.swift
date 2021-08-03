//
//  PicsumCollectionViewCell.swift
//  Picsum Browser
//
//  Created by Hindavi Technologies on 03/08/21.
//

import UIKit

class PicsumCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var picsumImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCollectionViewCell(with cellObject: Picsum) {
        self.authorLabel.text = cellObject.author
        let imageUrl = RequiredUrl.imageUrl.rawValue + String(cellObject.id ?? 0)
        
        if let url = URL(string: imageUrl) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }

                DispatchQueue.main.async {
                    self.picsumImageView.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}



