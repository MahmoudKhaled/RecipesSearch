//  DigestModel.swift

import Foundation

struct DigestResponse: Codable {
    let label, tag: String?
    let schemaOrgTag: String?
    let total: Double?
    let hasRDI: Bool?
    let daily: Double?
    let unit: String?
    let sub: [DigestResponse]?
}


struct DigestModel {
    let label, tag: String
    let schemaOrgTag: String
    let total: Double
    let hasRDI: Bool
    let daily: Double
    let unit: String
    let sub: [DigestModel]
    
    init(_ response: DigestResponse?) {
        label = response?.label ?? ""
        tag = response?.tag ?? ""
        schemaOrgTag = response?.schemaOrgTag ?? ""
        total = response?.total ?? 0.0
        hasRDI = response?.hasRDI ?? false
        daily = response?.daily ?? 0.0
        unit = response?.unit ?? ""
        sub = response?.sub?.map({DigestModel($0)}) ?? []
    }
    
}
