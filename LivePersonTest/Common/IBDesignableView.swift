//
//  IBDesignableView.swift
//  LivePersonTest
//
//  Created by Aleksandr Ponomarenko on 6/25/19.
//  Copyright © 2019 AS Developers. All rights reserved.
//

import UIKit

@IBDesignable
class IBDesignableView: UIView {

    var contentView: UIView?
    
    // MARK: - Lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func nibName() -> String {
        return String(describing: type(of: self))
    }
    
    func setupView() {
        guard let view = loadViewFromNib() else {
            return
        }
        
        view.frame = bounds
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName(), bundle: bundle)
        let nibObjects = nib.instantiate(withOwner: self, options: nil)
        
        return nibObjects.first as? UIView
    }
}
