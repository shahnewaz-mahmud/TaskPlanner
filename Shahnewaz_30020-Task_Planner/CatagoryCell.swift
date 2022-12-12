//
//  CatagoryCell.swift
//  Shahnewaz_30020-Task_Planner
//
//  Created by BJIT on 12/9/22.
//

import UIKit

protocol CatagoryCellDelegate {
    func setTaskCatagory(type: String)
}

class CatagoryCell: UITableViewCell {

    var delegate: CatagoryCellDelegate?
   
    @IBOutlet weak var catagoryCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        catagoryCollectionView.dataSource = self
        catagoryCollectionView.delegate = self
        
        let catagoryCollectionCellNib = UINib(nibName: Constants.catagoryCollectionViewCellId, bundle: nil)
        catagoryCollectionView.register(catagoryCollectionCellNib, forCellWithReuseIdentifier: Constants.catagoryCollectionViewCellId)
        
        // configure the catagory collection view.
        let catagoryCollectionCellLayout = UICollectionViewFlowLayout()
        catagoryCollectionCellLayout.itemSize = CGSize(width: 200, height: 300)
        
        catagoryCollectionCellLayout.scrollDirection = .horizontal
        
        catagoryCollectionView.collectionViewLayout = catagoryCollectionCellLayout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CatagoryCell: UICollectionViewDataSource {
    
    // set the number of row in collection view section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catagoryList.count
    }
    
    //set the reusable cell for each section
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let catagoryCollectionCell = catagoryCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.catagoryCollectionViewCellId, for: indexPath) as! CatagoryCollectionViewCell
        
        catagoryCollectionCell.catagoryTitile.text = catagoryList[indexPath.row]

        return catagoryCollectionCell
    }
    
    
}


extension CatagoryCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //ask delegate to call the function from viewController to set the catagory
        delegate?.setTaskCatagory(type: catagoryList[indexPath.row])
    }
}

extension CatagoryCell: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}



