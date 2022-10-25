//
//  ViewCodeProtocol.swift
//  MonalisaStoryboard
//
//  Created by Eliane Regina Nicácio Mendes on 20/10/22.
//

import Foundation

protocol ViewCodeProtocol: AnyObject {
    
    func addSubviews()
    func addConstraints()
    func setupViews()
    
    func callMethodsInCorrectSequence()
}

extension ViewCodeProtocol {
    func callMethodsInCorrectSequence() {
        addSubviews()
        addConstraints()
        setupViews()
    }
}
