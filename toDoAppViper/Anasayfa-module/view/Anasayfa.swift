import UIKit

class Anasayfa: UIViewController {

    @IBOutlet var notlarTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var yapilacaklarListe = [Notlar]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        notlarTableView.delegate = self
        notlarTableView.dataSource = self
        
        veritabaniKopyalama()
        AnasayfaRouter.createModule(ref: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.notlariYukle()
        //Anasayfaya dönüldüğünde veriler yüklenmiş olacak
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let not = sender as? Notlar {
                let gidilecekVC = segue.destination as! NotDetay
                gidilecekVC.gorev = not
            }
        }
    }
    func veritabaniKopyalama(){
        let bundleYolu = Bundle.main.path(forResource: "toDoApp", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDoApp.sqlite")
        
        let fm = FileManager.default
        if fm.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı oluştu")
        }else {
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}

extension Anasayfa : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(notlarListesi: Array<Notlar>) {
        self.yapilacaklarListe = notlarListesi
        self.notlarTableView.reloadData()
    }
}

extension Anasayfa : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}
extension Anasayfa : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let not = yapilacaklarListe[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "notlarHucre", for: indexPath) as! tableView
        hucre.notlarLabel.text = "\(not.notlar!)"
        hucre.baslikLabel.text = "\(not.not_baslik!)"
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let not = yapilacaklarListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: not)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let not = self.yapilacaklarListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(not.not_baslik!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.anasayfaPresenterNesnesi?.sil(not_id: not.not_id!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}

