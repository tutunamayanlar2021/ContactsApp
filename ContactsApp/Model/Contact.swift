//
//  Contact.swift
//  ContactsApp
//
//  Created by Kader Oral on 25.07.2023.
//

import UIKit

struct ContactModel{
    var name: String
    var image: UIImage{
        switch gender {
              case .male:
                  return UIImage(named: "male")!
              case .female:
                  return UIImage(named: "female")!
              case .build:
                  return UIImage(named: "build")!
              }
    }
    var contacts: Contacts
    var gender: Gender
        
    
}

enum Contacts : CaseIterable{
    case allContacts
    case family
    case friends
    case education
    case disconnected
    case classMate
    
    var contactType: String{
        switch self {
        case .allContacts:
            return "All Contacts"
        case .family:
            return "Family"
        case .friends:
            return "Friends"
        case .disconnected:
            return "Disconnected"
        case .education:
            return "School and Courses"
        case .classMate:
            return "Classmate"
            
        }
    }
    
}
enum Gender{
    case male
    case female
    case build
}

let contacts: [ContactModel] = [
    ContactModel(name: "Kader", contacts: .family ,gender: .female),
    ContactModel(name: "Merve", contacts: .friends,gender: .female),
    ContactModel(name: "Sena", contacts: .friends , gender: .female),
    ContactModel(name: "Ali", contacts: .friends,gender: .male),
    ContactModel(name: "Veli", contacts: .disconnected,gender: .female),
    ContactModel(name: "Okul", contacts: .education,gender: .build),
    ContactModel(name: "Anne", contacts: .family,gender: .female),
    ContactModel(name: "Deniz", contacts: .family,gender: .female),
    ContactModel(name: "ismail", contacts: .friends,gender: .male),
    ContactModel(name: "Aslı", contacts: .friends,gender: .female),
    ContactModel(name: "Suna", contacts: .family,gender: .female),
    ContactModel(name: "Komşu", contacts: .disconnected,gender: .male),
    ContactModel(name: "İlkay", contacts: .classMate,gender: .female),
    ContactModel(name: "Kurs", contacts: .education,gender: .build),
    ContactModel(name: "Merve", contacts: .classMate,gender: .female)
]
