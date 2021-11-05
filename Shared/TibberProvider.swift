//
//  TibberProvider.swift
//  TibberExpress
//
//  Created by Bror Brurberg on 05/11/2021.
//

import Foundation
import Apollo
import Network

class TibberProvider: ObservableObject {
    @Published var overview: OverviewQuery.Data.Viewer?
    @Published var loading = true
    
    func fetch() async -> Void {
        loading = true
        let result = try? await withCheckedThrowingContinuation { continuation in
            Network.shared.apollo.fetch(query: OverviewQuery()) {result in
                continuation.resume(with: result)
            }
        }
        /*if let unwrappedData = result?.data?.resultMap {
            let decoder = JSONDecoder()
            let data = try? decoder.decode(Viewer.self, from: try! JSONSerialization.data(withJSONObject: unwrappedData, options: .prettyPrinted))
            DispatchQueue.main.async {
                self.overview = data
            }
        }*/
        DispatchQueue.main.async {
            if let data = result?.data?.viewer {
                self.overview = data
            }
            self.loading = false
        }
        
        
    }
}

class Network {
    static let shared = Network()
    private(set) lazy var apollo: ApolloClient = {
        
            let cache = InMemoryNormalizedCache()
            let store1 = ApolloStore(cache: cache)
            let authPayloads = ["Authorization": "Bearer \(ApiKey().key)"]
            let configuration = URLSessionConfiguration.default
            configuration.httpAdditionalHeaders = authPayloads
            
            let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
            let provider = NetworkInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
            
            let url = URL(string: "https://api.tibber.com/v1-beta/gql")!
            
            let requestChainTransport = RequestChainNetworkTransport(
                interceptorProvider: provider,
                endpointURL: url
            )
            
            return ApolloClient(networkTransport: requestChainTransport,
                                store: store1)
        }()
}

class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(TokenInterceptor(), at: 0)
        return interceptors
    }
}

class TokenInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Swift.Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        request.addHeader(name: "Authorization", value: "Bearer \(ApiKey().key)")
        
        print("request :\(request)")
        print("response :\(String(describing: response))")
        
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
