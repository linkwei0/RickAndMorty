//
//  WelcomeViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 05.11.2023.
//

import Foundation

protocol WelcomeViewModelDelegate: AnyObject {
    func viewModelDidRequestToShowMenuScreen(_ viewModel: WelcomeViewModel)
}

class WelcomeViewModel {
    weak var delegate: WelcomeViewModelDelegate?
    
    func didTapStartButton() {
        delegate?.viewModelDidRequestToShowMenuScreen(self)
    }
}
