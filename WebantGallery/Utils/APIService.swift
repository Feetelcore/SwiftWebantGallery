//
//  APIService.swift
//  WebantGallery
//
//  Created by IVAN KHRAMOV on 11.05.2021.
//

import Foundation
import RxSwift

class APIService {
    private let builder = GalleryRequestBuilder()
    
    private let decoder = JSONDecoder()
    
    func fetchNewPhotos(page: Int) -> Observable<Response> {
        return NetworkManager<Response>().fetchPhotoArray(with: builder.fetchNewImages(page: page))
    }
}
