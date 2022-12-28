//
//  University.swift
//  Evyree
//
//  Created by William Chen on 2022/12/4.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

class University: NSObject, Codable {

    //Attributes
    
    //Document ID
    @DocumentID var id: String?
    var name: String?
    var emailDomain: String?
    
    
}
