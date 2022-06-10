//
//  KampanyalarVController.swift
//  IosCase
//
//  Created by Ufuk Anıl Özlük on 17.05.2022.
//

import UIKit

class KampanyalarVController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "Kampanyalar"
        label.center = view.center
        view.addSubview(label)
 
    }
    

   

}
