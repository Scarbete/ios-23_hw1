import UIKit
import SnapKit



class SuccessVC: UIViewController {
    
    private lazy var successImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "successImage")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var successLabel: UILabel = {
        let view = UILabel()
        view.text = "Success`"
        view.textColor = .white
        view.font = .systemFont(ofSize: 23, weight: .bold)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        setGradientBackground()
        setupSuccessImage()
        setupSuccessLabel()
    }
    
    private func setupSuccessImage() {
        view.addSubview(successImage)
        
        successImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(159)
            make.height.equalTo(183)
        }
    }

    private func setupSuccessLabel() {
        view.addSubview(successLabel)
        
        successLabel.snp.makeConstraints { make in
            make.top.equalTo(successImage.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
    }

}
