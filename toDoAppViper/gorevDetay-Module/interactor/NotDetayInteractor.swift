import Foundation

class NotDetayInteractor : PresenterToInteractorNotDetayProtocol {
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDoApp.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func notGuncelle(not_id: Int, not_baslik: String, notlar: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE notlar SET not_baslik = ? , notlar = ? WHERE not_id = ?", values: [not_baslik,notlar,not_id])
        }catch{
            print(error.localizedDescription)
        }
 
        db?.close()
    }
}
