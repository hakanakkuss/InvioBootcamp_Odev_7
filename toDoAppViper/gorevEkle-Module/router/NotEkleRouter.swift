import Foundation
class NotEkleRouter : PresenterToRouterNotEkleProtocol {
    static func createModule(ref: NotEkle) {
        ref.notEklePresenterNesnesi = NotEklePresenter()
        ref.notEklePresenterNesnesi?.notEkleInteractor = NotEkleInteractor()
    }
}
