import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
   
    
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func notlariYukle() {
        anasayfaInteractor?.tumNotlariAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.notAra(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(not_id: Int) {
        anasayfaInteractor?.notSil(not_id: not_id)
    }
    
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(notlarListesi: Array<Notlar>) {
        anasayfaView?.vieweVeriGonder(notlarListesi: notlarListesi)
    }
}
