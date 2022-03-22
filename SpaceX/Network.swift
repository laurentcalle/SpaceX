//
//  Network.swift
//  SpaceX
//
//  Created by Laurent Calle on 3/21/22.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api.spacex.land/graphql/")!)
}
