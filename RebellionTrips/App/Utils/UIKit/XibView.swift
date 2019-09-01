//
//  XibView.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

open class XibView: UIView {
    
    open var view: UIView?
    open var xibName: String?
    open var bundleView: Bundle? {
        return Bundle.main
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupXib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupXib()
    }
    
    func setupXib() {
        guard self.view == nil, let mainView = loadViewFromNib() else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        mainView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainView)
        mainView.bindFrameToSuperviewBounds()
        
        view = mainView
    }
    
    open func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: className(), bundle: bundle())
        let view = nib.instantiate(withOwner: self, options: nil).compactMap { $0 as? UIView}.first
        return view
    }
    
    open func className() -> String {
        if let xibName = xibName {
            return xibName
        } else {
            return String(describing: type(of: self))
        }
    }
    
    open func bundle() -> Bundle {
        if let bundle = bundleView {
            return bundle
        } else {
            return Bundle(for: type(of: self))
        }
    }
    
    override open func removeFromSuperview() {
        view?.removeFromSuperview()
        
        super.removeFromSuperview()
    }
}
