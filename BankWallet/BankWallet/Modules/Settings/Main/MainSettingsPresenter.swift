class MainSettingsPresenter {
    weak var view: IMainSettingsView?

    private let router: IMainSettingsRouter
    private let interactor: IMainSettingsInteractor

    init(router: IMainSettingsRouter, interactor: IMainSettingsInteractor) {
        self.router = router
        self.interactor = interactor
    }

}

extension MainSettingsPresenter: IMainSettingsViewDelegate {

    func viewDidLoad() {
        view?.set(allBackedUp: interactor.allBackedUp)
        view?.set(currentBaseCurrency: interactor.baseCurrency.code)
        view?.set(currentLanguage: interactor.currentLanguageDisplayName)
        view?.set(lightMode: interactor.lightMode)
        view?.set(appVersion: interactor.appVersion)
    }

    func didTapSecurity() {
        router.showSecuritySettings()
    }

    func didTapManageCoins() {
        router.showManageCoins()
    }

    func didTapBaseCurrency() {
        router.showBaseCurrencySettings()
    }

    func didTapLanguage() {
        router.showLanguageSettings()
    }

    func didSwitch(lightMode: Bool) {
        interactor.lightMode = lightMode
        router.reloadAppInterface()
    }

    func didTapAbout() {
        router.showAbout()
    }

    func didTapTellFriends() {
        router.showShare(appWebPageLink: interactor.appWebPageLink)
    }

    func didTapReportProblem() {
        router.showReportProblem()
    }

    func didTapCompanyLink() {
        router.open(link: interactor.companyWebPageLink)
    }

}

extension MainSettingsPresenter: IMainSettingsInteractorDelegate {

    func didUpdate(allBackedUp: Bool) {
        view?.set(allBackedUp: allBackedUp)
    }

    func didUpdateBaseCurrency() {
        view?.set(currentBaseCurrency: interactor.baseCurrency.code)
    }

}
