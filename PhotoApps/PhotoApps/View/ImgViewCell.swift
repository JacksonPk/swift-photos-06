//
//  ImgViewCell.swift
//  PhotoApps
//
//  Created by jinseo park on 3/25/21.
//

import UIKit

//UICollectionViewCell도 하나의 뷰이다.

class ImgViewCell : UICollectionViewCell {
    
    let bg : UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    override init(frame : CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(bg)
        
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        bg.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
