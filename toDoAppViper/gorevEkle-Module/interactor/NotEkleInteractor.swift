import Foundation
class NotEkleInteractor : PresenterToInteractorNotEkleProtocol {
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDoApp.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func notEkle(not_baslik: String, notlar: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO notlar (not_baslik,notlar) VALUES (?,?)", values: [not_baslik,notlar])
        }catch{
            print(error.localizedDescription)
        }
 
        db?.close()
    }
}
