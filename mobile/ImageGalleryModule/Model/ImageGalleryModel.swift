//
//  ImageGalleryModel.swift
//  mobile
//
//  Created by Johann Werner on 19.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import Foundation

struct ImageGalleryModel: Codable, ImageCollectionProtocol {
    
    var uri: String
    var smallImageUrl: String {
        return "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/SB_8277397.jpg/150px-SB_8277397.jpg"
//        return uri.appending("_2.jpg")
    }
    var bigImageUrl: String {
        return "https://designerdoginfo.files.wordpress.com/2012/04/puppy-and-adult-dog.jpg"
//        return uri.appending("_27.jpg")
    }
    
    var imageUrlToShow: String {
        return smallImageUrl
    }
}
