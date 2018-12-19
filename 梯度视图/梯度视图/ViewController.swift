//
//  ViewController.swift
//  梯度视图
//
//  Created by lemo on 2018/12/19.
//  Copyright © 2018年 wangli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTestView()
        
//        addButton()
        
//        addLabel()
        
//        addImage()
    }
    
    // 给图像添加梯度颜色-给渐变 view 添加一个图像 mask
    func addImage() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "空白页.png")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        
        let view1 = UIView(frame: imageView.bounds)
        view1.layer.addSublayer(gradientLayer)
        gradientLayer.frame = imageView.bounds
        view1.mask = imageView
        view1.center = self.view.center
        self.view.addSubview(view1)
    }
    
    // 给文字添加梯度颜色-给渐变 view 添加一个 label 的 mask
    func addLabel() {
        let titleLabel = UILabel()
        titleLabel.text = "见字如面"
        titleLabel.font = UIFont.systemFont(ofSize: 38)
        titleLabel.sizeToFit()
        
        let view1 = UIView(frame: titleLabel.bounds)
        view1.layer.addSublayer(gradientLayer)
        gradientLayer.frame = view1.bounds
        view1.mask = titleLabel
        view1.center = self.view.center
        self.view.addSubview(view1)
    }
    
    // 给 button 添加颜色梯度
    func addButton() {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 10, y: 100, width: self.view.bounds.width - 20, height: 49)
        btn.setTitle("确定", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        gradientLayer.frame = btn.bounds
        btn.layer.addSublayer(gradientLayer)
        btn.addTarget(self, action: #selector(hh), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func hh() {
        print("点击")
    }
    
    // 给 view 添加颜色梯度
    func addTestView() {
        self.gradientLayer.frame = lineView.bounds
        lineView.layer.addSublayer(gradientLayer)
        lineView.center = self.view.center
        self.view.addSubview(lineView)
    }
    
    var lineView: UIView = {
        let width: CGFloat = 100
        let lineView = UIView(frame: CGRect(x: 0, y: 120, width: width, height: width))
        
        return lineView
    }()
    
    var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [#colorLiteral(red: 0.03137254902, green: 0.2392156863, blue: 0.8117647059, alpha: 1).cgColor, #colorLiteral(red: 0.5470522374, green: 0.03827529067, blue: 0.8117647059, alpha: 1).cgColor]
        // X, Y坐标是反的,(0, 0) -> (1, 1) 左上角到右下角, (0.5, 0) -> (0.5, 1) 上半部分到下半部分
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = CGRect.zero
        return gradientLayer
    }()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

