//
//  PaintingViewController.swift
//  MonalisaStoryboard
//
//  Created by Eliane Regina Nicácio Mendes on 18/10/22.
//

import UIKit

class PaintingViewController: UIViewController {

    //MARK: - Properties
    var customView: PaintingView?
    
    override func loadView() {
        setupView()
    }

    private func setupView() {
        customView = PaintingView(delegate: self)
        view = customView
    }
}

extension PaintingViewController: PaintingViewDelegate {
    func colorButtonWasTapped(withColor color: UIColor) {
        let viewController = ColorViewController()
        viewController.color = color
        present(viewController, animated: true)
    }
}

