import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDoApp.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func tumNotlariAl() {
        var liste = [Notlar]()
        
        db?.open()
        
        do {
            let q = try db!.executeQuery("SELECT * FROM notlar", values: nil)
            while q.next() {
                let not = Notlar(not_id: Int(q.string(forColumn: "not_id"))!,
                                 not_baslik: q.string(forColumn: "not_baslik")!,
                                 notlar: q.string(forColumn: "notlar")!)
                liste.append(not)
            }
            anasayfaPresenter?.presenteraVeriGonder(notlarListesi: liste)
            
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
    }
    
    func notAra(aramaKelimesi: String) {
        var liste = [Notlar]()
        
        db?.open()
        
        do {
            let q = try db!.executeQuery("SELECT * FROM notlar WHERE not_baslik like '%\(aramaKelimesi)%'", values: nil)
            while q.next() {
                let not = Notlar(not_id: Int(q.string(forColumn: "not_id"))!,
                                 not_baslik: q.string(forColumn: "not_baslik")!,
                                 notlar: q.string(forColumn: "notlar")!)
                liste.append(not)
            }
            anasayfaPresenter?.presenteraVeriGonder(notlarListesi: liste)
            
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func notSil(not_id: Int) {
        
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM notlar WHERE not_id = ?", values: [not_id])
            tumNotlariAl()
        }catch{
            print(error.localizedDescription)
        }
 
        db?.close()
    }
}
