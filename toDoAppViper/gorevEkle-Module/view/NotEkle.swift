import UIKit

class NotEkle: UIViewController {

    @IBOutlet var tfNotBaslik: UITextField!
    @IBOutlet var tfNotlar: UITextView!
    
    var notEklePresenterNesnesi:ViewToPresenterNotEkleProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotEkleRouter.createModule(ref: self)
    }
    
    @IBAction func buttonEkle(_ sender: Any) {
        if let nb = tfNotBaslik.text , let n1 = tfNotlar.text {
            notEklePresenterNesnesi?.ekle(not_baslik: nb, notlar: n1)
        }
        
        
    }
}
