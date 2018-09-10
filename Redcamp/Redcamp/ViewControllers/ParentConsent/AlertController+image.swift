//
//  File.swift
//  Redcamp
//
//  Created by Gunjan Pathak on 7/9/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

extension UIAlertController{
    func addImage(image: UIImage){
        let imgAction = UIAlertAction(title: "", style: .default, handler: nil)
        imgAction.isEnabled = false
        imgAction.setValue(image.withRenderingMode(.alwaysOriginal), forKey: "image")
        self.addAction(imgAction)
    }
}
    
