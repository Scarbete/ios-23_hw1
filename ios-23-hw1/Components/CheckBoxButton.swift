import UIKit



class CheckboxButton: UIButton {
    
    let checkedImage = UIImage(systemName: "checkmark.square.fill")?.withRenderingMode(.alwaysTemplate)
    let uncheckedImage = UIImage(systemName: "square")?.withRenderingMode(.alwaysTemplate)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setImage(uncheckedImage, for: .normal)
        setImage(checkedImage, for: .selected)
        tintColor = .black
    }
    
    @objc func buttonTapped() {
        isSelected.toggle()
    }
}
