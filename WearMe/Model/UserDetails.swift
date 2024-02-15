//
//  UserDetails.swift
//  WearMe
//
//  Created by macbook27 on 15/02/24.
//

import Foundation

struct UserDetails {
    var email: String = ""
    var first_name: String = ""
    var id: String = ""
    var fullName: String = ""
    var accessToken: String = ""
    init(email: String, first_name: String, id: String, fullName: String, accessToken: String) {
        self.email = email
        self.first_name = first_name
        self.fullName = fullName
        self.id = id
        self.accessToken = accessToken
    }
    init() {
    }
}
