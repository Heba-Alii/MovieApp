//
//  NetworkProtocol.swift
//  MovieApp
//
//  Created by Heba on 15/10/2021.
//

import Foundation

protocol NetworkProtocol {
    func onSuccess()
    func onFailure(_ error : Error)
    func showIndicator()
    func hideIndicator()
}
