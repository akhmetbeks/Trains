//
//  FilterViewModel.swift
//  Trains
//
//  Created by Султан Ахметбек on 04.12.2025.
//
import Observation

@MainActor
@Observable
final class FilterViewModel {
    var selectedFilters: Set<Filter.Time> = []
    var stopOption: Filter.Stop = .no
}
