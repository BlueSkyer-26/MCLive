//
//  MCNewFeatureView.swift
//  MCLive
//
//  Created by admin on 2018/4/9.
//  Copyright © 2018年 BlueSkyer-25. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

class MCNewFeatureView: UIView {

    var imageArray : [String]?
    var imageScrollView : UIScrollView!
    
    init(imageArray:[String],isHideSkipButton:Bool) {
        let frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        super.init(frame: frame)
        self.imageArray = imageArray
        if self.imageArray?.count == 0 || self.imageArray == nil {return}
        self.setupImageScrollView(frame:frame)
        self.setupImageView()
    }
    
    func setupImageScrollView(frame:CGRect) -> Void {
        self.imageScrollView = UIScrollView.init(frame: frame)
        imageScrollView.backgroundColor = UIColor.green
        imageScrollView.contentSize = CGSize.init(width: (CGFloat)((self.imageArray?.count)!) * ScreenWidth, height: ScreenHeight)
        imageScrollView.isPagingEnabled = true
        imageScrollView.bounces = false
        imageScrollView.showsHorizontalScrollIndicator = false
        self.addSubview(imageScrollView)
    }
    
    func setupImageView() -> Void {
        guard let imageArray = self.imageArray else {
            return
        }
        for i in 0..<imageArray.count {
            let imageView = UIImageView.init(frame: CGRect.init(x: ScreenWidth * CGFloat(i), y: 0, width: ScreenWidth, height: ScreenHeight))
           
                imageView.image = UIImage.init(named: imageArray[i])
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(skipButtonClick)))
                self.imageScrollView.addSubview(imageView)
        }
    }
    
    @objc func skipButtonClick() -> Void {
        UIView.animate(withDuration: 1.0, animations: {
            self.alpha = 0
        }) { (conplete) in
            self.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("销毁")
    }
}
