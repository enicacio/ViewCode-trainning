//
//  ColorViewController.swift
//  MonalisaStoryboard
//
//  Created by Eliane Regina Nicácio Mendes on 25/10/22.
//

import UIKit

class ColorViewController: UIViewController {
    //MARK: - Properties
    var color: UIColor?
    
    //TODO: Criar uma classe ColorView e colocar essa propriedade lá
    private(set) lazy var colorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont (ofSize: 32, weight: .black)
        label.textColor = .white
        label.layer.opacity = 0.2
        label.accessibilityIdentifier = "painting-labet"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
        viewCodeMethods()
    }
    
    func viewCodeMethods() {
        guard let color = color else { return }
        colorLabel.text = getColorLabelText(withColor: color)
        view.addSubview(colorLabel)
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func getColorLabelText(withColor color: UIColor) -> String {
        let rgba = color.rgba
        let r = Int(rgba.red)
        let g = Int(rgba.green)
        let b = Int(rgba.blue)
        
        return "RGB: \(r), \(g), \(b)"
    }
}
