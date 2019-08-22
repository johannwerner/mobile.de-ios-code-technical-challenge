//
//  MainImageCollectionViewCell.swift
//  mobile
//
//  Created by Johann Werner on 22.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import UIKit

class MainImageCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    private let imageView = UIImageView()
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


// MARK: - Public
extension MainImageCollectionViewCell {
    func fill(with model: MainImageModel.ImageModel) {
        imageView.setRemoteImage(with: model.bigImageUrl)
    }
}

// MARK: - Private
private extension MainImageCollectionViewCell {
    func initUI() {
        contentView.addSubview(imageView)
        imageView.autoPinEdgesToSuperviewEdges()
        imageView.contentMode = .scaleAspectFill
    }
}

