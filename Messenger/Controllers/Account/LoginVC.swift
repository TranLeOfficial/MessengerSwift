//
//  LoginVC.swift
//  Messenger
//
//  Created by Trần Lễ on 9/27/21.
//

import UIKit


class LoginVC: UIViewController {
    
    //MARK: - object View
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "messenger")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        //add subView
        addSubView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.frame.size.width / 3
        let sizeWidth = view.frame.size.width
        imageView.frame = CGRect(x: (sizeWidth - size) / 2,
                                 y: size,
                                 width: size,
                                 height: size)
    }
    
    private func addSubView() {
        view.addSubview(imageView)
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}
