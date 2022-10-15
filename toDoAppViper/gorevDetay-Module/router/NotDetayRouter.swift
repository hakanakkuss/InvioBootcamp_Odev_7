import Foundation

class NotDetayRouter : PresenterToRouterNotDetayProtocol {
    static func createModule(ref: NotDetay) {
        ref.notDetayPresenterNesnesi = NotDetayPresenter()
        ref.notDetayPresenterNesnesi?.notDetayInteractor = NotDetayInteractor()
    }
}
