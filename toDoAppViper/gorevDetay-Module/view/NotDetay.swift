import UIKit

class NotDetay: UIViewController {
    
    @IBOutlet var tfNotBaslik: UITextField!
    @IBOutlet var tfNotlar: UITextView!
    
    var gorev:Notlar?
    
    var notDetayPresenterNesnesi:ViewToPresenterNotDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotDetayRouter.createModule(ref: self)

        if let n = gorev {
            tfNotBaslik.text = n.not_baslik
            tfNotlar.text = n.notlar
        }
// Do any additional setup after loading the view.
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let nb = tfNotBaslik.text , let n1 = tfNotlar.text , let n = gorev {
            notDetayPresenterNesnesi?.guncelle(not_id: n.not_id!, not_baslik: nb, notlar: n1)
    }
}
}
