//
//  LoginVC.swift
//  Messenger
//
//  Created by Trần Lễ on 9/27/21.
//

import UIKit


class LoginVC: UIViewController {
    
    //MARK: - object View
    //imageView
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "messenger")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    //scrollView
    private let scrollView : UIScrollView =  {
       let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
       return scrollView
    }()
    //textField
    private let emailField : UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email address..."
        //padding
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    private let passwordField : UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password..."
        //padding
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        return field
    }()
    
    //Button
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
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
        positionObjectView()
    }
    
    //set position view
    private func positionObjectView() {
        scrollView.frame = view.bounds
        let size = scrollView.width / 3
        let sizeWidth = scrollView.width
        imageView.frame = CGRect(x: (sizeWidth - size) / 2,
                                 y: size,
                                 width: size,
                                 height: size)
        emailField.frame = CGRect(x: 30,
                                 y: imageView.bottom + 20,
                                 width: scrollView.width - 60,
                                 height: 50)
        passwordField.frame = CGRect(x: 30,
                                 y: emailField.bottom + 10,
                                 width: scrollView.width - 60,
                                 height: 50)
        loginButton.frame = CGRect(x: 30,
                                 y: passwordField.bottom + 20,
                                 width: scrollView.width - 60,
                                 height: 50)
    }
    
    private func addSubView() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}
