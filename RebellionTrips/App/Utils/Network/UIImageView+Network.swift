//
//  UIImageView+Network.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    @discardableResult func download(url: URL) -> DataRequest {
        let request = Alamofire.request(url)
            .responseImage { [weak self] response in
                self?.image = response.result.value
        }
        return request
    }
}
