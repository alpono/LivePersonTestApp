//
//  PopupManager.swift
//  LivePersonTest
//
//  Created by Aleksandr Ponomarenko on 6/25/19.
//  Copyright © 2019 AS Developers. All rights reserved.
//

import Foundation
import UIKit

class PopupManager {
    
    static let shared = PopupManager()
    private let popupSequence: [PopupType] = [.start, .first, .second, .third, .fourth]
    private lazy var storyboard: UIStoryboard = {
        return UIStoryboard(name: "Main", bundle: nil)
    }()
    private var currentPopupType: PopupType? {
        didSet {
            let popupToShow = configurePopupVC(of: self.currentPopupType!)
            present(popup: popupToShow)
        }
    }
    
    private init() {
        if !isEmailProvided() {
            subscribeStateChanges()
        }
    }
    
    deinit {
        unsubscribe()
    }
    
    func emailProvided() {
        saveSuccessStatus()
        let successVC = configurePopupVC(of: .success)
        present(popup: successVC)
        unsubscribe()
    }
    
    private func present(popup: PopupViewController) {
        let topVC = currentTopVC()
        topVC.navigationController?.definesPresentationContext = true
        topVC.present(popup, animated: true, completion: nil)
    }
    
    private func configurePopupVC(of type: PopupType) -> PopupViewController {
        let popupToShow = storyboard.instantiateViewController(withIdentifier: "PopupVC") as! PopupViewController
        let config = PopupConfigBuilder.popupConfig(with: type)
        popupToShow.viewModel = PopupViewModel.init(with: config)
        popupToShow.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        return popupToShow
    }
    
    private func isPopupShown() -> Bool {
        let topVC = currentTopVC()
        if let modelVC = topVC.presentedViewController {
            return modelVC.isKind(of: PopupViewController.self)
        }
        return false
    }
    
    private func currentTopVC() -> UIViewController {
        guard let topVC = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError()
        }
        let nc = topVC as! UINavigationController
        return nc.topViewController!
    }

    private func subscribeStateChanges() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didBecomeActive(notification:)),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
    }
    
    private func unsubscribe(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func didBecomeActive(notification: Notification) {
        if currentPopupType != nil {
            if isPopupShown() == false {
                setNextType()
            }
        } else {
            self.currentPopupType = .start
        }
    }
    
    private func setNextType() {
        if currentPopupType != popupSequence.last {
            let currentTypeIndex = popupSequence.firstIndex(of: currentPopupType!)!
            currentPopupType = popupSequence[currentTypeIndex + 1]
        }
    }
}

extension PopupManager {
    static let stateStorageKey = "com.liveperson.testApp.emailStatus"
    
    private func saveSuccessStatus() {
        UserDefaults.standard.set(true, forKey: PopupManager.stateStorageKey)
    }
    
    private func isEmailProvided() -> Bool {
        return UserDefaults.standard.bool(forKey: PopupManager.stateStorageKey)
    }
}
