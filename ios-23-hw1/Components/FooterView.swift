import UIKit
import SnapKit



class FooterView: UIView {
    
    private lazy var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "footerBackground")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var dontHaveAccountLabel: UILabel = {
        let view = UILabel()
        view.text = "Don’t have an Account?"
        view.textColor = UIColor(hex: "#333")
        view.font = .systemFont(ofSize: 13, weight: .medium)
        return view
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let view = UIButton()
        view.setTitle("button", for: .normal)
        view.setTitleColor(UIColor(hex: "#4B94EA"), for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        return view
    }()
    
    private lazy var footerMainView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))

    override func layoutSubviews() {
        initUI()
    }
    
    private func initUI() {
        setupBackgorundImageView()
        setupFooterMainView()
        setupDontHaveAccountLabel()
        setupDontHaveAccountButton()
    }
    
    private func setupBackgorundImageView() {
        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupFooterMainView() {
        addSubview(footerMainView)
    }
    
    private func setupDontHaveAccountLabel() {
        footerMainView.addSubview(dontHaveAccountLabel)
        
        dontHaveAccountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalToSuperview().offset(19)
        }
    }
    
    private func setupDontHaveAccountButton() {
        footerMainView.addSubview(dontHaveAccountButton)
        
        dontHaveAccountButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(dontHaveAccountLabel.snp.trailing).offset(5)
        }
    }
    
    func setupButtonData(buttonTitle: String, target: Any?, action: Selector) {
        dontHaveAccountButton.setTitle(buttonTitle, for: .normal)
        dontHaveAccountButton.addTarget(target, action: action, for: .touchUpInside)
    }
}
