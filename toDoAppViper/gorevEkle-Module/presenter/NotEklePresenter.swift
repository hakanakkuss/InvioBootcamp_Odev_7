import Foundation

class NotEklePresenter : ViewToPresenterNotEkleProtocol {
    var notEkleInteractor: PresenterToInteractorNotEkleProtocol?
    
    func ekle(not_baslik: String, notlar: String) {
        notEkleInteractor?.notEkle(not_baslik: not_baslik, notlar: notlar)
    }
}
