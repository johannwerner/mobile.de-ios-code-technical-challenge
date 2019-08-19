//
//  String+Mobile.swift
//  Mobile
//
//  Created by Johann Werner on 16.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import Foundation

extension String {
    ///tableName is nil,
    ///missing string will be displayed when no value exists.
    func localizedString(_ comment: String = "") -> String {
        return NSLocalizedString(self, tableName: nil, value: "missing string", comment: comment)
    }
}
