//
//  SuggestionRow.swift
//
//  Adapted from Mathias Claassen 4/14/16 by Hélène Martin 8/11/16
//
//

import Foundation
import Eureka

public protocol SuggestionValue: Equatable, InputTypeInitiable {
    var suggestionString: String { get }
}

/// Generic suggestion row superclass that defines how to get a list of suggestions based on user input.
open class _SuggestionRow<Cell: CellType>: FieldRow<Cell> where Cell: BaseCell, Cell: TextFieldCell, Cell.Value: SuggestionValue {
//SuggestionCell<T>
    required public init(tag: String?) {
        super.init(tag: tag)

        displayValueFor = { value in
            return value?.suggestionString
        }
    }
}

/// Row that lets the user choose a suggested option from a list shown in the inputAccessoryView.
public final class SuggestionAccessoryRow<T: SuggestionValue>: _SuggestionRow<SuggestionCollectionCell<T, SuggestionCollectionViewCell<T>>>, RowType {
    public var filterFunction: ((String, @escaping ([T]) -> Void) -> Void)!

    required public init(tag: String?) {
        super.init(tag: tag)
    }
}

/// Row that lets the user choose a suggestion option from a table below the row.
public final class SuggestionTableRow<T: SuggestionValue>: _SuggestionRow<SuggestionTableCell<T, SuggestionTableViewCell<T>>>, RowType {
    public var filterFunction: ((String, @escaping ([T]) -> Void) -> Void)!
    
    required public init(tag: String?) {
        super.init(tag: tag)
    }
}
