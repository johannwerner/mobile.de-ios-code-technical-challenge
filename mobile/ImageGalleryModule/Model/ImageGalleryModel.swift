//
//  ImageGalleryModel.swift
//  mobile
//
//  Created by Johann Werner on 19.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import Foundation

struct ImageGalleryModel: Codable {
    
    var images: [Image]
    
    struct Image: Codable, ImageCollectionProtocol {
        var uri: String
        
        var smallImageUrl: String {
            return "http://\(uri)_2.jpg"
        }
        
        var bigImageUrl: String {
            return "http://\(uri)_27.jpg"
        }
        
        var imageUrlToShow: String {
            return smallImageUrl
        }
    }

}
