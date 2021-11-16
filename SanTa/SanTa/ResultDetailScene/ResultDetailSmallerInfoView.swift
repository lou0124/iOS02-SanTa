//
//  SwipeViewBefore.swift
//  SwipeView
//
//  Created by Jiwon Yoon on 2021/11/10.
//

import UIKit

class ResultDetailSmallerInfoView: UIView {

    private let kilo = UILabel()
    private let time = UILabel()
    private let steps = UILabel()
    private let maxAltitude = UILabel()
    private let minAltitude = UILabel()
    private let avgSpeed = UILabel()
    
    private let kiloStackView = UIStackView()
    private let timeStackView = UIStackView()
    private let stepStackView = UIStackView()
    private let maxAltStackView = UIStackView()
    private let minAltStackView = UIStackView()
    private let avgSpdStackView = UIStackView()
    
    private let leftInset: CGFloat = 20
    private let rightInset: CGFloat = 20
    private let topInset: CGFloat = 20
    
    
    init() {
        super.init(frame: .zero)
        self.layout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        displayArrowImage()
        self.configureKilometerStackView(with: "3.14")
        self.configureTimeStackView(time: "00:18")
        self.configureStepStackView(with: "1,456")
        self.configureMaxAltStackView(with: "48")
        self.configureMinAltStackView(with: "19")
        self.configureAvgSpeedStackView(with: "3.34")
        
        let upperStack = UIStackView()
        upperStack.axis = .horizontal
        upperStack.distribution = .fillEqually
        upperStack.spacing = 50
        upperStack.addArrangedSubview(kiloStackView)
        upperStack.addArrangedSubview(timeStackView)
        upperStack.addArrangedSubview(stepStackView)
        
        let lowerStack = UIStackView()
        lowerStack.axis = .horizontal
        lowerStack.distribution = .fillEqually
        lowerStack.spacing = 50
        lowerStack.addArrangedSubview(maxAltStackView)
        lowerStack.addArrangedSubview(minAltStackView)
        lowerStack.addArrangedSubview(avgSpdStackView)
        
        let totalStack = UIStackView()
        totalStack.axis = .vertical
        totalStack.spacing = 30
        totalStack.addArrangedSubview(upperStack)
        totalStack.addArrangedSubview(lowerStack)
        self.addSubview(totalStack)
        
        totalStack.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            totalStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            totalStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func displayArrowImage() {
        let arrow = UIImage(systemName: "chevron.compact.up")?.withTintColor(.black)
        let imageView = UIImageView(image: arrow)
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let arrowConstraints = [
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(arrowConstraints)
    }
    
    private func configureKilometerStackView(with kilometer: String) {
        self.addSubview(kiloStackView)
        self.kilo.text = kilometer
        let kiloDescription = UILabel()
        kiloDescription.text = "킬로미터"
        self.kiloStackView.axis = .vertical
        self.kiloStackView.alignment = .center
        self.kiloStackView.addArrangedSubview(kilo)
        self.kiloStackView.addArrangedSubview(kiloDescription)
    }
    
    private func configureTimeStackView(time: String) {
        self.addSubview(timeStackView)
        self.time.text = time
        let timeDescription = UILabel()
        timeDescription.text = "시간"
        self.timeStackView.axis = .vertical
        self.timeStackView.alignment = .center
        self.timeStackView.addArrangedSubview(self.time)
        self.timeStackView.addArrangedSubview(timeDescription)
    }
    
    private func configureStepStackView(with steps: String) {
        self.addSubview(stepStackView)
        self.steps.text = steps
        let stepDescription = UILabel()
        stepDescription.text = "걸음"
        self.stepStackView.axis = .vertical
        self.stepStackView.alignment = .center
        self.stepStackView.addArrangedSubview(self.steps)
        self.stepStackView.addArrangedSubview(stepDescription)
    }
    
    private func configureMaxAltStackView(with maxAltitude: String) {
        self.addSubview(maxAltStackView)
        self.maxAltitude.text = maxAltitude
        let maxAltDescription = UILabel()
        maxAltDescription.text = "최고 고도"
        self.maxAltStackView.axis = .vertical
        self.maxAltStackView.alignment = .center
        self.maxAltStackView.addArrangedSubview(self.maxAltitude)
        self.maxAltStackView.addArrangedSubview(maxAltDescription)
    }
    
    private func configureMinAltStackView(with minAltitude: String) {
        self.addSubview(minAltStackView)
        self.minAltitude.text = minAltitude
        let minAltDescription = UILabel()
        minAltDescription.text = "최저 고도"
        self.minAltStackView.axis = .vertical
        self.minAltStackView.alignment = .center
        self.minAltStackView.addArrangedSubview(self.minAltitude)
        self.minAltStackView.addArrangedSubview(minAltDescription)
    }
    
    private func configureAvgSpeedStackView(with speed: String) {
        self.addSubview(avgSpdStackView)
        self.avgSpeed.text = speed
        let avgSpeedDescription = UILabel()
        avgSpeedDescription.text = "평균 속도"
        self.avgSpdStackView.axis = .vertical
        self.avgSpdStackView.alignment = .center
        self.avgSpdStackView.addArrangedSubview(self.avgSpeed)
        self.avgSpdStackView.addArrangedSubview(avgSpeedDescription)
    }
}