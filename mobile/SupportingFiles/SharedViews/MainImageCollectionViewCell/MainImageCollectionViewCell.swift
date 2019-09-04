//
//  MainImageCollectionViewCell.swift
//  mobile
//
//  Created by Johann Werner on 22.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import UIKit
import PureLayout

final class MainImageCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    private let imageView = UIImageView()
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Public
extension MainImageCollectionViewCell {
    func fill(with model: ImageCollectionProtocol) {
        imageView.setRemoteImage(with: model.imageUrlToShow)
    }
}

// MARK: - Private
private extension MainImageCollectionViewCell {
    func initUI() {
        contentView.addSubview(imageView)
        imageView.autoPinEdgesToSuperviewEdges()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
}

