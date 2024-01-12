import UIKit
import SnapKit



class ViewController: UIViewController {
    
    private let height = UIScreen.main.bounds.height
    private var isPasswordShow = false
    
    private lazy var mainImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "imageMain")
        return view
    }()

    private lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    private lazy var emailLabel: UILabel = {
        let view = UILabel()
        view.text = "Employee Id / Email"
        view.textColor = UIColor(hex: "#A5A5A5")
        view.font = .systemFont(ofSize: 12, weight: .medium)
        return view
    }()
    
    private lazy var emailTF: UITextField = {
        let view = UITextField()
        view.attributedPlaceholder = NSAttributedString(
            string: "Enter your email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        view.textColor = UIColor(hex: "#323643")
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.clear.cgColor
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 5))
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 5))
        view.leftView = leftView
        view.rightView = rightView
        view.leftViewMode = .always
        view.rightViewMode = .always
        return view
    }()

    private lazy var emailBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#E1E3E8")
        return view
    }()
    
    private lazy var passwordLabel: UILabel = {
        let view = UILabel()
        view.text = "Password"
        view.textColor = UIColor(hex: "#A5A5A5")
        view.font = .systemFont(ofSize: 12, weight: .medium)
        return view
    }()
    
    private lazy var passwordTF: UITextField = {
        let view = UITextField()
        view.attributedPlaceholder = NSAttributedString(
            string: "Enter your password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        view.textColor = UIColor(hex: "#323643")
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.clear.cgColor
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 5))
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 5))
        view.leftView = leftView
        view.rightView = rightView
        view.leftViewMode = .always
        view.rightViewMode = .always
        return view
    }()

    private lazy var passwordShowButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        view.tintColor = .black
        return view
    }()
    
    private lazy var passwordBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#E1E3E8")
        return view
    }()
    

    private lazy var forgotPasswordButton: UIButton = {
        let view = UIButton()
        view.setTitle("Forgot Password?", for: .normal)
        view.setTitleColor(UIColor(hex: "#4B94EA"), for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        return view
    }()

    private lazy var checkBoxButton = CheckboxButton()
    
    private lazy var checkBoxLabel: UILabel = {
        let view = UILabel()
        view.text = "Remember Me"
        view.textColor = .black
        view.font = .systemFont(ofSize: 18, weight: .medium)
        return view
    }()

    private lazy var signInButton: UIButton = {
        let view = UIButton()
        view.setTitle("Sign In", for: .normal)
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor(hex: "#2855AE")
        view.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        view.setTitleColor(.white, for: .normal)
        return view
    }()
    
    private lazy var signInContinueLabal: UILabel = {
        let view = UILabel()
        view.text = "Sign in to continue"
        view.textColor = .white
        view.font = .systemFont(ofSize: 20, weight: .regular)
        view.layer.opacity = 0.7
        return view
    }()
    
    private lazy var welcomeBackLabel: UILabel = {
        let view = UILabel()
        view.text = "Welcome Back"
        view.textColor = .white
        view.font = .systemFont(ofSize: 34, weight: .bold)
        return view
    }()
    
    private lazy var footerView: UIView = {
        let view = FooterView()
        view.setupButtonData(buttonTitle: "Sign Up", target: self, action: #selector(footerButtonTapped))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    private func initUI() {
        setGradientBackground()
        setupMainImage()
        setupWhiteView()
        setupEmailLabel()
        setupEmailTF()
        setupEmailBottomView()
        setupPasswordLabel()
        setupPasswordTF()
        setupPasswordBottomView()
        setupPasswordShowButton()
        setupForgotPasswordButton()
        setupCheckBoxButton()
        setupCheckBoxLabel()
        setupSignInButton()
        setupSignInContinueLabal()
        setupWelcomeBackLabel()
        setupFooterView()
    }
    
    private func setupMainImage() {
        view.addSubview(mainImage)
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(-24)
            make.width.equalTo(350)
            make.height.equalTo(256)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupWhiteView() {
        view.addSubview(whiteView)
        
        whiteView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(height / 1.65)
        }
    }
    
    private func setupEmailLabel() {
        whiteView.addSubview(emailLabel)
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(43)
            make.leading.equalToSuperview().offset(23)
        }
    }
    
    private func setupEmailTF() {
        whiteView.addSubview(emailTF)
        
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(38)
        }
    }
    
    private func setupEmailBottomView() {
        whiteView.addSubview(emailBottomView)
        
        emailBottomView.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(1)
        }
    }
    
    private func setupPasswordLabel() {
        whiteView.addSubview(passwordLabel)
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailBottomView.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(23)
        }
    }
    
    private func setupPasswordTF() {
        whiteView.addSubview(passwordTF)
        
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(38)
        }
    }
    
    private func setupPasswordBottomView() {
        whiteView.addSubview(passwordBottomView)
        
        passwordBottomView.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(1)
        }
    }
    
    private func setupPasswordShowButton() {
        whiteView.addSubview(passwordShowButton)
        
        passwordShowButton.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(15)
            make.trailing.equalToSuperview().offset(-37)
            make.width.equalTo(18)
            make.height.equalTo(13)
        }
        
        passwordShowButton.addTarget(self, action: #selector(changePasswordShow), for: .touchUpInside)
    }
    
    private func setupForgotPasswordButton() {
        whiteView.addSubview(forgotPasswordButton)
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordBottomView.snp.bottom).offset(3)
            make.trailing.equalToSuperview().offset(-23)
        }
        
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
    
    private func setupCheckBoxButton() {
        whiteView.addSubview(checkBoxButton)
        
        checkBoxButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(23)
            make.width.height.equalTo(24)
        }
    }
    
    private func setupCheckBoxLabel() {
        whiteView.addSubview(checkBoxLabel)
        
        checkBoxLabel.snp.makeConstraints { make in
            make.top.equalTo(checkBoxButton.snp.top)
            make.leading.equalTo(checkBoxButton.snp.trailing).offset(13)
        }
    }
    
    private func setupSignInButton() {
        whiteView.addSubview(signInButton)
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(checkBoxButton.snp.bottom).offset(35)
            make.centerX.equalToSuperview()
            make.width.equalTo(168)
            make.height.equalTo(40)
        }
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    private func setupSignInContinueLabal() {
        view.addSubview(signInContinueLabal)
        
        signInContinueLabal.snp.makeConstraints { make in
            make.bottom.equalTo(whiteView.snp.top).offset(-8)
            make.leading.equalToSuperview().offset(15)
        }
    }
    
    private func setupWelcomeBackLabel() {
        view.addSubview(welcomeBackLabel)
        
        welcomeBackLabel.snp.makeConstraints { make in
            make.bottom.equalTo(signInContinueLabal.snp.top).offset(-4)
            make.leading.equalToSuperview().offset(15)
        }
    }
    
    private func setupFooterView() {
        whiteView.addSubview(footerView)
        
        footerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(30)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(90)
        }
    }
    
    @objc func changePasswordShow(_ sender: UIButton) {
        isPasswordShow = !isPasswordShow
        passwordTF.isSecureTextEntry = isPasswordShow
        isPasswordShow
            ? passwordShowButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            : passwordShowButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
    }
    
    @objc func forgotPasswordButtonTapped(_ sender: UIButton) {
        let vc = ForgotPasswordVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func filledStateTF(tf: UITextField, placeholder: String) {
        tf.text = ""
        tf.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.clear]
        )
        tf.placeholder = placeholder
        tf.layer.borderColor = UIColor.clear.cgColor
    }
    
    private func emptyStateTF(tf: UITextField, placeholder: String) {
        tf.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
        )
        tf.placeholder = placeholder
        tf.layer.borderColor = UIColor.red.cgColor
    }
    
    @objc func signInButtonTapped(_ sender: UIButton) {
        let vc = SuccessVC()
        
        if emailTF.hasText && passwordTF.hasText && passwordTF.text?.count ?? 0 > 3 && checkBoxButton.isSelected {
            filledStateTF(tf: emailTF, placeholder: "Enter your email")
            filledStateTF(tf: passwordTF, placeholder: "Enter your password")
            checkBoxLabel.textColor = .black
            checkBoxButton.isSelected.toggle()
            navigationController?.pushViewController(vc, animated: true)
            
        }
        else {
            emptyStateTF(tf: emailTF, placeholder: "Email is empty")
            emptyStateTF(tf: passwordTF, placeholder: "value is empty or less than 3")
            checkBoxLabel.textColor = .red
        }
    }
    
    @objc func footerButtonTapped(_ sender: UIButton) {
        let vc = SignUpVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
