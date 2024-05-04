import UIKit
import SnapKit

protocol RandomTextViewDelegate: AnyObject {
    func didTapButton()
}

class RandomTextView: UIView {
    let label: UILabel = {
        let label = UILabel()
        label.text = "Random Text"
        label.textAlignment = .center
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Generate Random Text", for: .normal)
        return button
    }()
    
    weak var delegate: RandomTextViewDelegate?
    
    var buttonCallback: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(label)
        addSubview(button)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(20)
        }
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        delegate?.didTapButton()
        buttonCallback?()
    }
    
    func setLabelText(_ text: String) {
        label.text = text
    }
}
