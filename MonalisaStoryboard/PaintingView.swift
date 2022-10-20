//
//  PaintingView.swift
//  MonalisaStoryboard
//
//  Created by Eliane Regina Nicácio Mendes on 18/10/22.
//

import Foundation
import UIKit

protocol PaintingViewDelegate: AnyObject {
    func colorButtonWasTapped(withColor color: UIColor)
}

class  PaintingView: UIView {
    
    weak var delegate: PaintingViewDelegate?
    
    let colors = [
        UIColor(red: 172/255, green: 92/255, blue: 44/255, alpha: 1.0),
        UIColor(red: 200/255, green: 163/255, blue: 83/255, alpha: 1.0),
        UIColor(red: 40/255, green: 25/255, blue: 37/255, alpha: 1.0),
        UIColor(red: 137/255, green: 120/255, blue: 70/255, alpha: 1.0),
        UIColor(red: 155/255, green: 160/255, blue: 104/255, alpha: 1.0),
    ]
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "mona-lisa")
        imageView.contentMode = .scaleAspectFill
        imageView.accessibilityIdentifier = "painting-image"
        return imageView
    }()
    
    private(set) lazy var paintingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Monalisa"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textColor = .white
        label.accessibilityIdentifier = "painting-label"
        return label
    }()
    
    private(set) lazy var datelabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "1503-1506"
        label.textAlignment = . left
        label.numberOfLines = 1
        label.font = UIFont.preferredFont (forTextStyle: .footnote)
        label.textColor = .white
        label.accessibilityIdentifier = "date-label"
        return label
    }()
    
    private(set) lazy var artistlabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Pintura de Leonardo da Vinci"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.preferredFont (forTextStyle: .footnote)
        label.textColor = .white
        label.accessibilityIdentifier = "artist-label"
        return label
    }()
    
    private(set) lazy var divider: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    private(set) lazy var buttonZero: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = colors[0]
        button.addTarget(self, action: #selector(buttonWasTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var buttonFirst: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = colors[1]
        button.addTarget(self, action: #selector(buttonWasTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var buttonSecond: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = colors[2]
        button.addTarget(self, action: #selector(buttonWasTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var buttonThird: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = colors[3]
        button.addTarget(self, action: #selector(buttonWasTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buttonZero, buttonFirst, buttonSecond, buttonThird])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.accessibilityTraits = .none
        return stackView
    }()
    
    init(delegate: PaintingViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        callMethodsInCorrectSequence()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func buttonWasTapped(_ sender: UIButton) {
        switch sender {
        case buttonZero:
            delegate?.colorButtonWasTapped(withColor: colors[0])
        case buttonFirst:
            delegate?.colorButtonWasTapped(withColor: colors[1])
        case buttonSecond:
            delegate?.colorButtonWasTapped(withColor: colors[2])
        case buttonThird:
            delegate?.colorButtonWasTapped(withColor: colors[3])
        default: break
        }
    }
}

extension PaintingView: ViewCodeProtocol {
    func addSubviews() {
        addSubview(imageView)
        addSubview(paintingLabel)
        addSubview(datelabel)
        addSubview(artistlabel)
        addSubview(divider)
        addSubview(stackView)
    }
    
    func addConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        paintingLabel.translatesAutoresizingMaskIntoConstraints = false
        datelabel.translatesAutoresizingMaskIntoConstraints = false
        artistlabel.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint (equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 88.0),
            
            divider.leadingAnchor.constraint (equalTo: leadingAnchor),
            divider.trailingAnchor.constraint (equalTo: trailingAnchor),
            divider.bottomAnchor.constraint (equalTo: stackView.topAnchor),
            divider.heightAnchor.constraint (equalToConstant: 8.0),
            
            artistlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            artistlabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            artistlabel.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: -24.0),
            
            datelabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            datelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            datelabel.bottomAnchor.constraint(equalTo: artistlabel.topAnchor, constant: -16.0),
            
            paintingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            paintingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            paintingLabel.bottomAnchor.constraint(equalTo: datelabel.topAnchor, constant: -4.0),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: paintingLabel.topAnchor, constant: -8.0),
        ])
    }
    
    func setupViews() {
        backgroundColor = .black
        divider.backgroundColor = .white
        stackView.backgroundColor = .white
    }
}
