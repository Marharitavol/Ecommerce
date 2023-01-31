//
//  DataFetcherService.swift
//  Ecommerce
//
//  Created by Rita on 28.01.2023.
//

import Foundation

class DataFetcherService {
var dataFetcher: DataFetcher!

  init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
      self.dataFetcher = dataFetcher
  }
    func fetchData(completion: @escaping (ForMainVC?) -> Void) {
        let url = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
        dataFetcher.fetchGenericJSONData(urlString: url, response: completion)
    }
}


