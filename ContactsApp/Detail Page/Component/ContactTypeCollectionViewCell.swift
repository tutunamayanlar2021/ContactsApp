//
//  ContactTypeCollectionViewCell.swift
//  ContactsApp
//
//  Created by Kader Oral on 25.07.2023.
//

import UIKit

class ContactTypeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contactTypeImageView: UIImageView!
    
    @IBOutlet weak var contactTypeTitleLabel: UILabel!
   
    func setup(with contact: ContactModel) {
            contactTypeImageView.image = contact.image
           contactTypeTitleLabel.text = contact.name
        }
 
}
