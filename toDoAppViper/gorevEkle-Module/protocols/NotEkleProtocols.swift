import Foundation

protocol ViewToPresenterNotEkleProtocol {
    var notEkleInteractor:PresenterToInteractorNotEkleProtocol? {get set}
    
    func ekle(not_baslik:String,notlar:String)
}
protocol PresenterToInteractorNotEkleProtocol {
    func notEkle(not_baslik:String,notlar:String)
}

protocol PresenterToRouterNotEkleProtocol {
    static func createModule(ref:NotEkle)
}
