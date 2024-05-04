import UIKit
import SnapKit
class ViewController: UIViewController, RandomTextViewDelegate {
    let randomStrings = ["Hello, World!", "Hello Aldiyar!", "Hello Nurali!", "Hello Swift!", "Hello ITStep!"]
    
    let randomTextView = RandomTextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupRandomTextView()
    }

    private func setupRandomTextView() {
        view.addSubview(randomTextView)
        
        randomTextView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        randomTextView.delegate = self
        
        randomTextView.buttonCallback = {
            self.generateRandomText()
        }
    }
    
    func didTapButton() {
        generateRandomText()
    }
    
    private func generateRandomText() {
        if let randomString = randomStrings.randomElement() {
            randomTextView.setLabelText(randomString)
        }
    }
}

