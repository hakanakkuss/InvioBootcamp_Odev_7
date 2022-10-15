import UIKit
import Lottie

class BaslangicEkraniViewController: UIViewController {
   
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animationView = .init(name: "lottie")
        animationView.frame = view.bounds
        animationView.frame = CGRect(x: -38, y: -28, width: 500, height: 500)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        view.addSubview(animationView)
        animationView.play()
        
     
        
    }
    @IBAction func baslaButton(_ sender: Any) {
        performSegue(withIdentifier: "basla", sender: nil)
    }
}
