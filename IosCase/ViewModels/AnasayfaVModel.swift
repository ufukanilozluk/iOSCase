//
//  CitiesMainVModel.swift
//  IosCase
//
//  Created by Ufuk Anıl Özlük on 30.11.2020.
//

import Alamofire
import Foundation
import UIKit

class AnasayfaVModel: MainVModel {
    var delegate: AnasayfaVModelDelegate? // Delegator Class
    let selfView: UIView

    init(view: UIView) {
        selfView = view
    }

    func getCategories(url: String) {
        var data: [Kategori] = []

        startLoader(uiView: selfView)
        Alamofire.request(url, method: .get, encoding: URLEncoding.default).responseJSON { response in

            switch response.result {
            case let .success(JSON):

                if let response = JSON as? [[String: Any]] {
                    for el in response {
                        data.append(Kategori(json: el))
                    }
                    self.delegate?.getCategoryCompleted(data: data)

                } else {
                    print("Cast olamadı")
                }

            case let .failure(error):
                print(error.localizedDescription)
            }
            self.stopLoader(uiView: self.selfView)
        }
    }

    func getCokSatan(url: String) {
        var data: [CokSatan] = []

        startLoader(uiView: selfView)
        Alamofire.request(url, method: .get, encoding: URLEncoding.default).responseJSON { response in

            switch response.result {
            case let .success(JSON):

                if let response = JSON as? [[String: Any]] {
                    for el in response {
                        data.append(CokSatan(json: el))
                    }
                    self.delegate?.getCoksatanCompleted(data: data)

                } else {
                    print("Cast olamadı")
                }

            case let .failure(error):
                print(error.localizedDescription)
            }
            self.stopLoader(uiView: self.selfView)
        }
    }

    func getMarkalar(url: String) {
        var data: [Markalar] = []

        startLoader(uiView: selfView)
        Alamofire.request(url, method: .get, encoding: URLEncoding.default).responseJSON { response in

            switch response.result {
            case let .success(JSON):

                if let response = JSON as? [[String: Any]] {
                    for el in response {
                        data.append(Markalar(json: el))
                    }
                    self.delegate?.getMarkalarCompleted(data: data)

                } else {
                    print("Cast olamadı")
                }

            case let .failure(error):
                print(error.localizedDescription)
            }
            self.stopLoader(uiView: self.selfView)
        }
    }

    func getSliderPics(url: String) {
        var data: [Slider] = []

        startLoader(uiView: selfView)
        Alamofire.request(url, method: .get, encoding: URLEncoding.default).responseJSON { response in

            switch response.result {
            case let .success(JSON):

                if let response = JSON as? [[String: Any]] {
                    for el in response {
                        data.append(Slider(json: el))
                    }
                    self.delegate?.getSliderCompleted(data: data)

                } else {
                    print("Cast olamadı")
                }

            case let .failure(error):
                print(error.localizedDescription)
            }
            self.stopLoader(uiView: self.selfView)
        }
    }
}
