//
//  TabbarController.swift
//  IosCase
//
//  Created by Ufuk Anıl Özlük on 5.01.2021.
//

import Network
import UIKit

class TabbarController: UITabBarController, UITabBarControllerDelegate {
    let button = UIButton(type: .custom)
    let image = UIImage(named: "sepetim")

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.iosCaseGreen], for: .selected)
        tabBar.tintColor = Colors.iosCaseGreen
        delegate = self

        let toMakeButtonUp = 35
        button.frame = CGRect(x: 0.0, y: -5.0, width: 95, height: 95)
//        button.setBackgroundImage(ADD, for: .normal)
//        button.setBackgroundImage(ADD, for: .highlighted)
        button.backgroundColor = .white
        button.setTitleColor(.systemGray, for: .normal)
        button.setTitle("Sepetim", for: .normal)
        button.imageView?.tintColor = .systemGray
        button.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
        button.alignImageAndTitleVertically()
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.addShadow(opacity: 0.4)
        let heightDifference: CGFloat = CGFloat(toMakeButtonUp)
        if heightDifference < 0 {
            button.center = tabBar.center
        } else {
            var center: CGPoint = tabBar.center
            center.y = center.y - heightDifference / 2.0
            button.center = center
        }
        button.addTarget(self, action: #selector(btnTouched), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func btnTouched() {
        print("adasdas")
        selectedIndex = tabBar.items!.count / 2
        button.setTitleColor(Colors.iosCaseGreen, for: .normal)
        button.imageView?.tintColor = Colors.iosCaseGreen
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
        if selectedIndex != tabBar.items!.count / 2 {
            button.setTitleColor(.systemGray, for: .normal)
            button.imageView?.tintColor = .systemGray
        } else {
            // do whatever
        }
    }
}
