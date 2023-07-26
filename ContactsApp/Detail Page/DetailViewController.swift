//
//  DetailViewController.swift
//  ContactsApp
//
//  Created by Kader Oral on 25.07.2023.
//

import UIKit

class DetailViewController: UIViewController{
    var contact: ContactModel?
    var filteredContacts: [ContactModel] = []
    
    
    @IBOutlet weak var cantactTypeCollectionView: UICollectionView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var contactLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 150) // Ayarlamak istediğiniz hücre boyutlarına göre değerleri burada değiştirebiliriz
        layout.minimumLineSpacing = 20 // Hücreler arası satır aralığı
        layout.minimumInteritemSpacing = 20 // Hücreler arası sütun aralığı
        cantactTypeCollectionView.collectionViewLayout = layout
        cantactTypeCollectionView.dataSource = self 
        cantactTypeCollectionView.delegate = self
        
    }
    
    private func setupUI() {
        if let contact = contact {
            detailImageView.image = contact.image
            nameLabel.text = contact.name
            contactLabel.text = contact.contacts.contactType
            
            
        }
        
        if let selectedContactType = contact?.contacts {
            filteredContacts = contacts.filter { $0.contacts == selectedContactType && $0.name != contact?.name }
        }
        
        
    }
    
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredContacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactTypeCollectionViewCell", for: indexPath) as! ContactTypeCollectionViewCell
        let contact = filteredContacts[indexPath.item] // Burada doğru contact'ı alıyoruz
        
        cell.setup(with: contact)
        
        return cell
    }
}







