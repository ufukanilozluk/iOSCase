//
//  SehirlerVModelDelegate.swift
//  IosCase
//
//  Created by Ufuk Anıl Özlük on 25.11.2020.
//

import Foundation

protocol AnasayfaVModelDelegate: MainVModelDelegate {
    func getCategoryCompleted(data:[Kategori])
    func getCoksatanCompleted(data:[CokSatan])
    func getSliderCompleted(data:[Slider])
    func getMarkalarCompleted(data:[Markalar])
}
