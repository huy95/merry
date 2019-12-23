//
//  ViewController.swift
//  merryChristmas
//
//  Created by Huy on 12/23/19.
//  Copyright © 2019 Huy. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var soundPlayer: AVAudioPlayer?
    var timer: Timer!
    
    // khai báo biến n
    var n = 5
    
    // khai báo biến đếm
    var count = 0
    var imagemain: UIView = {
        let imageMain = UIView()
        imageMain.translatesAutoresizingMaskIntoConstraints = false
        imageMain.backgroundColor = .black
        return imageMain
    }()
    var imageEnd: UIImageView = {
        let imageEnd = UIImageView()
        imageEnd.translatesAutoresizingMaskIntoConstraints = false
        imageEnd.image = UIImage(named: "anh1")
        imageEnd.contentMode = .scaleAspectFill
        imageEnd.alpha = 0
        return imageEnd
    }()
    var image2: UIImageView = {
        let image2 = UIImageView()
        image2.translatesAutoresizingMaskIntoConstraints = false
        image2.image = UIImage(named: "anh5")
        image2.contentMode = .scaleAspectFit
        image2.alpha = 1
        return image2
    }()
    var image3: UIImageView = {
        let image3 = UIImageView()
        image3.translatesAutoresizingMaskIntoConstraints = false
        image3.image = UIImage(named: "thong3")
        image3.contentMode = .scaleAspectFill
        image3.alpha = 1
        return image3
    }()
    var button1: UILabel = {
        let button1 = UILabel()
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.text = "Hello !! Merry Christmas"
        button1.numberOfLines = 2
        button1.textColor = .white
        button1.backgroundColor = .black
        button1.font = .systemFont(ofSize: 60)
        button1.alpha = 0.0
        return button1
    }()
    var button2: UILabel = {
        let button2 = UILabel()
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.text = "24 - 12"
        button2.textColor = .black
        button2.backgroundColor = .white
        button2.font = .boldSystemFont(ofSize: 40)
//        button2.layer.cornerRadius = 30
        return button2
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imagemain)
        imagemain.addSubview(image3)
        imagemain.addSubview(imageEnd)
        imagemain.addSubview(image2)
        
        
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(n), target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
//        imagemain.addSubview(image3)
//        imagemain.addSubview(image4)
//        imagemain.addSubview(button1)
        imagemain.addSubview(button2)
        imagemain.addSubview(button1)
        button2.layer.cornerRadius = 30
        playSound()
        inputLabel()
        setupLayout()
    }
    @objc func runTimer(){
        print("runloop")
        count -= 1
        print(count)
        if count == -10 {
            soundPlayer?.pause()
            timer.invalidate()
        }
        if count == 2 {

            if count == -1 {
            UIView.animate(withDuration: 10){
            self.button2.alpha = 0
            self.image2.alpha = 0
            self.imageEnd.alpha = 1
//            self.button1.alpha = 1
            }
            }
        }
        

    }
    func setupLayout(){
        imagemain.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        imagemain.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        imagemain.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        imagemain.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        imageEnd.topAnchor.constraint(equalTo: imagemain.topAnchor, constant: 0).isActive = true
        imageEnd.leftAnchor.constraint(equalTo: imagemain.leftAnchor, constant: 0).isActive = true
        imageEnd.rightAnchor.constraint(equalTo: imagemain.rightAnchor, constant: 0).isActive = true
        imageEnd.bottomAnchor.constraint(equalTo: imagemain.bottomAnchor, constant: 0).isActive = true
        
        image2.topAnchor.constraint(equalTo: imagemain.topAnchor, constant: 250).isActive = true
        image2.leftAnchor.constraint(equalTo: imagemain.leftAnchor, constant: 0).isActive = true
        image2.rightAnchor.constraint(equalTo: imagemain.rightAnchor, constant: 0).isActive = true
        image2.bottomAnchor.constraint(equalTo: imagemain.topAnchor, constant: 600).isActive = true
        
        image3.topAnchor.constraint(equalTo: imagemain.topAnchor, constant: 0).isActive = true
        image3.leftAnchor.constraint(equalTo: imagemain.leftAnchor, constant: 0).isActive = true
        image3.rightAnchor.constraint(equalTo: imagemain.rightAnchor, constant: 0).isActive = true
        image3.bottomAnchor.constraint(equalTo: imagemain.bottomAnchor, constant: 0).isActive = true
        
        UIView.animate(withDuration: 10){
                  self.button2.alpha = 0
                  self.image2.alpha = 0
                  self.imageEnd.alpha = 1
                  self.button1.alpha = 1
            
                  }
   
        }
    func inputLabel() {
        button1.centerYAnchor.constraint(equalTo: imagemain.centerYAnchor, constant: 320).isActive = true
        button1.centerXAnchor.constraint(equalTo: imagemain.centerXAnchor, constant: 0).isActive = true
        button1.widthAnchor.constraint(equalTo: imagemain.widthAnchor, multiplier: 1).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 120)
        
        button2.centerYAnchor.constraint(equalTo: imagemain.centerYAnchor, constant: -100).isActive = true
        button2.centerXAnchor.constraint(equalTo: imagemain.centerXAnchor, constant: 100).isActive = true
        button2.widthAnchor.constraint(equalTo: imagemain.widthAnchor, multiplier: 1/3).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 40)
    }
    func playSound(){
        let path = Bundle.main.path(forResource: "cris.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
            // đặt numberOfLoops = -1 để nó chạy lại khi chạy hết
            soundPlayer?.numberOfLoops = -1
        } catch {
            print("lỗi")
            // couldn't load file :(
        }
    }
}
