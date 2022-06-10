//
//  MainVModel.swift
//  IosCase
//
//  Created by Ufuk Anıl Özlük on 25.11.2020.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class MainVModel {

    let spinner = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50), type: .ballRotateChase, color: UIColor(red: 0.26, green: 0.41, blue: 0.62, alpha: 1.00))
    
    func startLoader(uiView: UIView) {
        spinner.center = uiView.center
        uiView.addSubview(spinner)
        spinner.startAnimating()
    }

    func stopLoader(uiView: UIView) {
        spinner.stopAnimating()
    }
}
