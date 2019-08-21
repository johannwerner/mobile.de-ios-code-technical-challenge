//
//  ImageGalleryModel.swift
//  mobile
//
//  Created by Johann Werner on 19.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import Foundation

struct ImageGalleryModel: Codable {
    var uri: String
    var smallImageUrl: String {
        return "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/SB_8277397.jpg/150px-SB_8277397.jpg"
//        return uri.appending("_2.jpg")
    }
    var bigImageUrl: String {
        return "https://www.nationalgeographic.com/content/dam/animals/thumbs/rights-exempt/mammals/d/domestic-dog_thumb.ngsversion.1484159404151.adapt.1900.1.jpg"
//        return uri.appending("_27.jpg")
    }
}
