//
//  PhotoSearchViewModel.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burns on 09/07/2024.
//

import Foundation
import Combine

enum HomeViewState {
    case load([Photo])
    case error
}

final class PhotoSearchViewModel: ObservableObject {
   // @Published var photosList = [Photo]()
    @Published var homeViewState = HomeViewState.load([])

    private var searchedWord = PassthroughSubject<String, Error>()
    private var repository: PhotoRepositoryProtocol
    private var anyCancellable = Set<AnyCancellable>()

    init(repository: PhotoRepositoryProtocol = PhotoRepository()) {
        self.repository = repository
        bindSearch()
    }
}

extension PhotoSearchViewModel {
    func search(_ value: String) {
        searchedWord.send(value)
    }
    private func bindSearch() {
        searchedWord.debounce(for: 1.0, scheduler: DispatchQueue.main).sink { completed in
            print(completed)
        } receiveValue: { value in
            Task { [weak self] in
                await self?.getSearchedPhotosWithText(searchTerm: value)
            }
        }.store(in: &anyCancellable)
    }

    @MainActor
    func getSearchedPhotosWithText(searchTerm: String) async  {
        do {
           let photoData = try await repository.getPhotosData(withSearchTerm: searchTerm)
           // self.photosList = photoData.items
            homeViewState = .load(photoData.items)
        } catch {
            homeViewState = .error
        }
    }
}

