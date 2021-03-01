//
//  URLSupportable.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation

protocol URLSupportable {
    var scheme: String {get set}
    var user: String? {get set}
    var password: String? {get set}
    var host: String? {get set}
    var port: Int? {get set}
    var path: String {get set}
    var queryItems: [String : String]? {get set}
}
