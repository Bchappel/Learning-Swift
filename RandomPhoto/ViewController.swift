//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Braedan Chappel on 2024-05-26.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        
        button.setTitleColor(.black, for: .normal)
        
        return button
        
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame =  CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        button.frame = CGRect(x: 20, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 55)
        
        button.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        getRandomPhoto()
    }
    
    let colours: [UIColor] = [.systemPink, .systemOrange, .systemYellow, .systemMint]
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20, y: view.frame.size.height-50-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 50)
    }

    func getRandomPhoto(){
        let urlString = "https://picsum.photos/200/300"
        
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        
        imageView.image = UIImage(data: data)
        
    }
    
    
    @objc func btnClick(){
        getRandomPhoto()
        view.backgroundColor = colours.randomElement()
        
    }
    
    

}

