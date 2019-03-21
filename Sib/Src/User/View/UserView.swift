//
//  UserView.swift
//  Sib
//
//  Created by Alexander Golovanov on 21/03/2019.
//  Copyright © 2019 Alexander Golovanov. All rights reserved.
//

import UIKit

class UserView: UIView {
    @IBOutlet weak internal var firstName: UILabel!
    @IBOutlet weak internal var lastName: UILabel!
    @IBOutlet weak internal var photoView: UIImageView!
    @IBOutlet weak internal var placeholderView: UIView!
    @IBOutlet weak internal var statusImgLabel: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        let view = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)?.first as! UIView
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func configure(userViewModel: UserViewModel) {
        firstName.text = userViewModel.firstName
        lastName.text = userViewModel.lastName
        userViewModel.loadPhoto { (imageNetworkResult) in
            DispatchQueue.main.async { [weak self]  in
                switch imageNetworkResult {
                case .success(let image):
                    self?.imageDidLoad(image)
                case .failure(let error):
                    self?.imageLoadFailed(error: error)
                }
            }
        }
    }
    
    func imageDidLoad(_ image: UIImage) {
        placeholderView.isHidden = true
        photoView.image = image
    }
    
    func imageLoadFailed(error: Error?) {
        placeholderView.isHidden = false
        statusImgLabel.text = "something went wrong"
    }
}
