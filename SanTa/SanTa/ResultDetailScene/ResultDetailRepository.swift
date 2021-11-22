//
//  ResultDetailRepository.swift
//  SanTa
//
//  Created by Jiwon Yoon on 2021/11/22.
//

import Foundation

protocol ResultDetailRepository {
//    func update(id: UUID, title: String, completion: @escaping (Result<>))
    func delete(id: String, completion: @escaping (Result<Void, Error>) -> Void)
}

class DefaultResultDetailRepository: ResultDetailRepository {
    private let recordStorage: CoreDataRecordStorage
    
    init(recordStorage: CoreDataRecordStorage) {
        self.recordStorage = recordStorage
    }
    func delete(id: String, completion: @escaping (Result<Void, Error>) -> Void) {
        self.recordStorage.delete(id: id, completion: completion)
        
    }
}
