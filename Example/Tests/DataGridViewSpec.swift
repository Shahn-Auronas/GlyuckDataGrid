//
//  DataGridViewSpec.swift
//
//  Created by Vladimir Lyukov on 30/07/15.
//

import Quick
import Nimble
import GlyuckDataGrid


class DataGridViewSpec: QuickSpec {
    override func spec() {
        var dataGridView: DataGridView!

        beforeEach {
            dataGridView = DataGridView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        }

        describe("dataGridDataSource") {
            it("should assign dataSource to DataGridDataSourceWrapper") {
                let dataSource = StubDataGridViewDataSource()
                dataGridView.dataGridDataSource = dataSource
                expect(dataGridView.dataSource).to(beTruthy())
                let dataSourceWrapper = dataGridView.dataSource as! DataGridDataSourceWrapper
                expect(dataSourceWrapper.dataGridDataSource) === dataSource
            }
        }

        describe("dataGridDelegate") {
            it("should assign delegate to DataGridDelegateWrapper") {
                let delegate = StubDataGridViewDelegate()
                dataGridView.dataGridDelegate = delegate
                expect(dataGridView.delegate).to(beTruthy())
                let delegateWrapper = dataGridView.delegate as! DataGridDelegateWrapper
                expect(delegateWrapper.dataGridDelegate) === delegate
            }
        }

        describe("layout") {
            it("should be instance of DataGridViewLayout") {
                expect(dataGridView.collectionViewLayout).to(beAKindOf(DataGridViewLayout.self))
            }
            it("should have collectionView and dataGridView properties set") {
                let layout = dataGridView.collectionViewLayout as? DataGridViewLayout
                expect(layout).to(beTruthy())
                if let layout = layout {
                    expect(layout.dataGridView) === dataGridView
                    expect(layout.collectionView) === dataGridView
                }
            }
        }
    }
}