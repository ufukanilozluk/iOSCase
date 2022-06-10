//
//  SepetVController.swift
//  IosCase
//
//  Created by Ufuk Anıl Özlük on 17.05.2022.
//

import UIKit

class SepetVController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.textAlignment = .center
        label.text = "Sepet"
        label.center = view.center
        view.addSubview(label)
    }
    

   
}
