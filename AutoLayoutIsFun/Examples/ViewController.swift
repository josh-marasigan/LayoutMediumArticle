//
//  ViewController.swift
//  AutoLayoutIsFun
//
//  Created by Josh Marasigan on 6/11/20.
//  Copyright © 2020 Josh Marasigan. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController
{
    // Button to present the storyboard implementation
    private lazy var button: UIButton =
    {
        let button = UIButton()
        button.layer.cornerRadius = 4.0
        button.layer.masksToBounds = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(onTouch), for: .touchUpInside)
        button.setTitle("See Storyboard", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.isHidden = true
        
        self.view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(64.0)
        }
        
        return button
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 244/255, green: 238/255, blue: 200/255, alpha: 1.0)
        
        configUI()
    }
    
    func configUI()
    {
        // Uncomment to toggle between implementations
        configWithFrames()
//        configWithAnchors()
//        configWithSnapKit()
        
        // Uncomment to show the button to present the storyboard implementation
//        button.isHidden = true
    }
    
    private func configWithFrames()
    {
        let frame1 = CGRect(x: 20, y: 100, width: 157, height: 157)
        let view1 = UIView(frame: frame1)
        view1.backgroundColor = .systemOrange

        let frame2 = CGRect(x: 197.5, y: 100, width: 157, height: 157)
        let view2 = UIView(frame: frame2)
        view2.backgroundColor = .systemTeal

        self.view.addSubview(view1)
        self.view.addSubview(view2)
    }
    
    private func configWithSnapKit()
    {
        let view1 = UIView()
        view1.backgroundColor = UIColor.systemIndigo
        view.addSubview(view1)

        view1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(view.snp.width).dividedBy(2).offset(-30)
        }

        let view2 = UIView()
        view2.backgroundColor = UIColor.systemPink
        view.addSubview(view2)

        view2.snp.makeConstraints { make in
            make.centerY.equalTo(view1)
            make.leading.equalTo(view1.snp.trailing).offset(20)
            make.width.height.equalTo(view1)
        }
    }
    
    private func configWithAnchors()
    {
        let view1 = UIView()
        view1.backgroundColor = UIColor.systemRed
        view1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view1)
        
        view1.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        view1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        view1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -30).isActive = true
        view1.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -30).isActive = true
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.systemBlue
        view2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view2)
        
        view2.centerYAnchor.constraint(equalTo: view1.centerYAnchor).isActive = true
        view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 20).isActive = true
        view2.widthAnchor.constraint(equalTo: view1.widthAnchor).isActive = true
        view2.heightAnchor.constraint(equalTo: view1.heightAnchor).isActive = true
    }
}

/// Presents Storyboard view
extension ViewController
{
    @objc private func onTouch()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StoryboardExampleVC")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
