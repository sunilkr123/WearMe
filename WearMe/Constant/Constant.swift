//
//  Constant.swift
//  WearMe
//
//  Created by macbook27 on 13/02/24.
//

import Foundation

class Constant {
    // criteria in regex.  See http://regexlib.com
    static let emailRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$"
    
    // criteria in regex.  See http://regexlib.com
    static let passwordRegex = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$"
    static let googleApiKey = "618422777235-c7b08qs5s14f7usl4a6v7022pkhsp7p4.apps.googleusercontent.com"

}
