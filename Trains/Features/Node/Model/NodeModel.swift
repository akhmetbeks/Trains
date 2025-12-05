//
//  NodeModel.swift
//  Trains
//
//  Created by Султан Ахметбек on 05.12.2025.
//

struct NodeModel: Identifiable, Hashable {
    let id: String
    let title: String
    let code: String?
}

extension Region {
    var asNodeItem: NodeModel? {
        guard let title, !title.isEmpty else { return nil }
        return NodeModel(
            id: codes?.yandex_code ?? title,
            title: title,
            code: codes?.yandex_code
        )
    }
}

extension Station {
    var asNodeItem: NodeModel? {
        guard let title, !title.isEmpty else { return nil }
        let code = codes?.yandex_code ?? codes?.esr_code
        return NodeModel(
            id: code ?? title,
            title: title,
            code: code
        )
    }
}
