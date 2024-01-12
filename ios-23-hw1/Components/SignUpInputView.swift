import UIKit
import SnapKit


class SignUpInputView: UIView {
    
    private var isPasswordShow = false
    private var isPasswordConfirmShow = false
    var isInputHasText: Bool = false

    private lazy var inputLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12, weight: .medium)
        view.textColor = UIColor(hex: "#A5A5A5")
        return view
    }()

    private lazy var inputTF: UITextField = {
        let view = UITextField()
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        view.leftView = leftView
        view.rightView = rightView
        view.leftViewMode = .always
        view.rightViewMode = .always
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#E1E3E8")
        return view
    }()

    private lazy var passwordButton: UIButton = MakerView.makerView.createButton(setImage: UIImage(systemName: "eye.fill"))
    
    
    override func layoutSubviews() {
        initUI()
    }
    
    
    private func initUI() {
        configureInputLabel()
        configureInputTF()
        configureBottomView()
    }
    
    private func configureInputLabel() {
        addSubview(inputLabel)
        
        inputLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    private func configureInputTF() {
        addSubview(inputTF)
        
        inputTF.snp.makeConstraints { make in
            make.top.equalTo(inputLabel.snp.bottom).offset(3)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    private func configureBottomView() {
        addSubview(bottomView)
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(inputTF.snp.bottom).offset(3)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    private func configurePasswordButtonInInputView(tag: Int) {
//        addSubview(passwordButton)
        inputTF.addSubview(passwordButton)
        
        passwordButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.right.equalToSuperview()
//            make.top.equalToSuperview().offset(30)
//            make.right.equalToSuperview().offset(-8)
            make.width.equalTo(18)
            make.height.equalTo(12)
        }
        
        passwordButton.tag = tag
        passwordButton.addTarget(self, action: #selector(passwordBtnTapped), for: .touchUpInside)
    }
    
    private func filledStateTF(placeholder: String) {
        inputTF.layer.borderWidth = 0
        inputTF.placeholder = placeholder
    }
    
    private func emptyStateTF(placeholder: String) {
        inputTF.layer.borderWidth = 1
        inputTF.placeholder = placeholder
    }
    
    func checkValueTF(emptyPlaceholder: String) {
        if inputTF.hasText {
            filledStateTF(placeholder: emptyPlaceholder)
            isInputHasText = true
        }
        else {
            emptyStateTF(placeholder: emptyPlaceholder)
            isInputHasText = false
        }
    }
    
    func getInputValue() -> String {
        if let text = inputTF.text {
            return text
        }
        else {
            return ""
        }
    }
    
    func errorPassword() {
        inputTF.text = ""
        inputTF.attributedPlaceholder = NSAttributedString(
            string: "Пароли не совпадают!",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
        )
    }
    
    func setupDataUI(labelText: String, placeholderTF: String, isPassword: Bool = false, btnTag: Int = 0) {
        inputLabel.text = labelText
        inputTF.placeholder = placeholderTF
        
        if isPassword == true {
            configurePasswordButtonInInputView(tag: btnTag)
        }
    }
    
    @objc func passwordBtnTapped(_ sender: UIButton) {
        if sender.tag == 10 {
            isPasswordShow = !isPasswordShow
            inputTF.isSecureTextEntry = isPasswordShow
        }
        else if sender.tag == 11 {
            isPasswordConfirmShow = !isPasswordConfirmShow
            inputTF.isSecureTextEntry = isPasswordConfirmShow
        }
    }
}
