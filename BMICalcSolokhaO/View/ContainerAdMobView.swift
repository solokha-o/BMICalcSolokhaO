//
//  ContainerAdMobView.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 26.09.2021.
//

import UIKit
import GoogleMobileAds

class ContainerAdMobView: UIView, GADBannerViewDelegate {
    
    var bannerView: GADBannerView!
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.load(GADRequest())
        bannerView.delegate = self
        addBannerViewToView(bannerView)
        self.frame.size = CGSize(width: 300, height: 50)
        
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bannerView)
        self.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: safeAreaLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: self,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
}
