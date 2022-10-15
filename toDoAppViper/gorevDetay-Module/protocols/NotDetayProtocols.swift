import Foundation

protocol ViewToPresenterNotDetayProtocol {
    var notDetayInteractor:PresenterToInteractorNotDetayProtocol? {get set}
    
    func guncelle(not_id:Int,not_baslik:String,notlar:String)
}

protocol PresenterToInteractorNotDetayProtocol {
    func notGuncelle(not_id:Int,not_baslik:String,notlar:String)
}

protocol PresenterToRouterNotDetayProtocol {
    static func createModule(ref:NotDetay)
}
