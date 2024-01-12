import UIKit
import SnapKit



class SignUpVC: UIViewController {
    private let height = UIScreen.main.bounds.height
    
    private lazy var mainImage: UIImageView = MakerView.makerView.createImage(image: UIImage(named: "imageMain"))
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.masksToBounds = true
        return view
    }()
        
    private lazy var fullNameForm: SignUpInputView = {
        let view = SignUpInputView()
        view.setupDataUI(labelText: "Full Name", placeholderTF: "Enter your full name")
        return view
    }()

    private lazy var mobileNumberForm: SignUpInputView = {
        let view = SignUpInputView()
        view.setupDataUI(labelText: "Mobile Number", placeholderTF: "Enter your mobile number")
        return view
    }()

    private lazy var emailForm: SignUpInputView = {
        let view = SignUpInputView()
        view.setupDataUI(labelText: "Email", placeholderTF: "Enter your email")
        return view
    }()

    private lazy var userNameForm: SignUpInputView = {
        let view = SignUpInputView()
        view.setupDataUI(labelText: "User Name", placeholderTF: "Enter your user name")
        return view
    }()

    private lazy var passwordForm: SignUpInputView = {
        let view = SignUpInputView()
        view.setupDataUI(labelText: "Password", placeholderTF: "Enter your password", isPassword: true, btnTag: 10)
        return view
    }()

    private lazy var confirmPasswordForm: SignUpInputView = {
        let view = SignUpInputView()
        view.setupDataUI(labelText: "Confirm Password", placeholderTF: "Confirm password", isPassword: true, btnTag: 11)
        return view
    }()

    private lazy var signUpButton: UIButton = MakerView.makerView.createButton(
        text: "Sign Up", textColor: .white, fontSize: 18, fontWeight: .medium, cornerRadius: 15, backgroundColor: UIColor(hex: "#2855AE")
    )
    
    private lazy var footerView: UIView = {
        let view = FooterView()
        view.setupButtonData(buttonTitle: "Sign Up", target: self, action: #selector(footerSignInTapped))
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
    private func initUI() {
        setGradientBackground()
        configureMainImage()
        configureWhiteView()
        configureFullName()
        configureMobileNumber()
        configureEmail()
        configureUserName()
        configurePassword()
        configureConfirmPassword()
        configureSignUpButton()
        configureFooter()
    }
    
    
    
    private func configureMainImage() {
        view.addSubview(mainImage)
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(256)
        }
    }
    
    private func configureWhiteView() {
        view.addSubview(whiteView)
        
        whiteView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(height / 1.30)
        }
    }
    
    private func configureFullName() {
        whiteView.addSubview(fullNameForm)

        fullNameForm.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(55)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(62)
        }
    }

    private func configureMobileNumber() {
        whiteView.addSubview(mobileNumberForm)

        mobileNumberForm.snp.makeConstraints { make in
            make.top.equalTo(fullNameForm.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(62)
        }
    }

    private func configureEmail() {
        whiteView.addSubview(emailForm)

        emailForm.snp.makeConstraints { make in
            make.top.equalTo(mobileNumberForm.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(62)
        }
    }

    private func configureUserName() {
        whiteView.addSubview(userNameForm)

        userNameForm.snp.makeConstraints { make in
            make.top.equalTo(emailForm.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(62)
        }
    }

    private func configurePassword() {
        whiteView.addSubview(passwordForm)

        passwordForm.snp.makeConstraints { make in
            make.top.equalTo(userNameForm.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(62)
        }
    }

    private func configureConfirmPassword() {
        whiteView.addSubview(confirmPasswordForm)

        confirmPasswordForm.snp.makeConstraints { make in
            make.top.equalTo(passwordForm.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(62)
        }
    }
    
    private func configureSignUpButton() {
        whiteView.addSubview(signUpButton)
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordForm.snp.bottom).offset(33)
            make.centerX.equalToSuperview()
            make.width.equalTo(168)
            make.height.equalTo(40)
        }
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    private func configureFooter() {
        view.addSubview(footerView)
        
        footerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(68)
        }
    }
    
    @objc func signUpValidate(arr: [SignUpInputView]) {
        for i in 0...arr.count - 1 {
            arr[i].checkValueTF(emptyPlaceholder: "Заполните пожалуйста!")
        }
    }
    
    @objc func signUpButtonTapped(_ sender: UIButton) {
        let arr: [SignUpInputView] = [fullNameForm, mobileNumberForm, emailForm, userNameForm, passwordForm, confirmPasswordForm]
        signUpValidate(arr: arr)
        
        let isInputsHasText = fullNameForm.isInputHasText &&
        mobileNumberForm.isInputHasText &&
        emailForm.isInputHasText &&
        userNameForm.isInputHasText &&
        passwordForm.isInputHasText &&
        confirmPasswordForm.isInputHasText
        
        if isInputsHasText {
            if passwordForm.getInputValue() == confirmPasswordForm.getInputValue() {
                navigationController?.pushViewController(SuccessVC(), animated: true)
            }
            else {
                confirmPasswordForm.errorPassword()
            }
        }
    }
    
    @objc func footerSignInTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
