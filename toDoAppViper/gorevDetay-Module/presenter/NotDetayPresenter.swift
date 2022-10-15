import Foundation
class NotDetayPresenter : ViewToPresenterNotDetayProtocol {
    var notDetayInteractor: PresenterToInteractorNotDetayProtocol?
    
    func guncelle(not_id: Int, not_baslik: String, notlar: String) {
        notDetayInteractor?.notGuncelle(not_id: not_id, not_baslik: not_baslik, notlar: notlar)
    }
}
