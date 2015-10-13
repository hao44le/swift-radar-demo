//
//  ViewController.swift
//  swift-radar-demo
//
//  Created by Gelei Chen on 12/10/2015.
//  Copyright © 2015 ziliuxue. All rights reserved.
//

import UIKit
import Charts
class ViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var _chartView: RadarChartView!
    @IBOutlet weak var userInput: UITextField!
    @IBAction func buttonClicked(sender: UIButton) {
        let number = userInput.text
        self.mult = UInt32(number!)!
        self.setData()
    }
    var mult : UInt32 = 150
    let count = 9
    
    let parties  = [
    "Party A", "Party B", "Party C", "Party D", "Party E", "Party F",
    "Party G", "Party H", "Party I", "Party J", "Party K", "Party L",
    "Party M", "Party N", "Party O", "Party P", "Party Q", "Party R",
    "Party S", "Party T", "Party U", "Party V", "Party W", "Party X",
    "Party Y", "Party Z"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bar Chart"
        _chartView.delegate = self
        
        _chartView.descriptionText = ""
        _chartView.webLineWidth = 0.75
        _chartView.innerWebLineWidth = 0.375
        _chartView.webAlpha = 1.0
        let marker : BalloonMarker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1.0), font: UIFont.systemFontOfSize(12), insets: UIEdgeInsetsMake(8, 8, 20, 8))
        marker.minimumSize = CGSizeMake(80, 40)
        _chartView.marker = marker
        
        let xAxis : ChartXAxis = _chartView.xAxis
        xAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 9)!
        let yAxis : ChartYAxis = _chartView.yAxis
        yAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 9)!
        yAxis.labelCount = 5
        yAxis.startAtZeroEnabled = true
        
        let l : ChartLegend = _chartView.legend
        //l.position = ChartLegendPosition.RightOfChart
        l.font = UIFont(name: "HelveticaNeue-Light", size: 10)!
        l.xEntrySpace = 7.0
        l.yEntrySpace = 5.0
        self.setData()
    }
    func setData(){
        
        var yVals1 : [ChartDataEntry] = []
        var yVals2 : [ChartDataEntry] = []
        for index in 0...count {
           yVals1.append(ChartDataEntry(value: Double(arc4random_uniform(mult)+mult/2), xIndex: index))
            yVals2.append(ChartDataEntry(value: Double(arc4random_uniform(mult)+mult/2), xIndex: index))
            
        }
        
        var xVals : [String] = []
        for index in 0...count {
            xVals.append(self.parties[index % parties.count])
            
        }
        
        
        let set1 : RadarChartDataSet = RadarChartDataSet(yVals: yVals1, label: "Set1")
        
        set1.drawFilledEnabled = true
        set1.lineWidth = 2.0
        let set2 : RadarChartDataSet = RadarChartDataSet(yVals: yVals2, label: "Set 2")
//        [set2 setColor:ChartColorTemplates.vordiplom[4]]
        set2.drawFilledEnabled = true
        set2.lineWidth = 2.0
        
        
        let data : RadarChartData = RadarChartData(xVals: xVals, dataSets: [set1,set2])
        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 8))
        data.setDrawValues(false)
        
        _chartView.data = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

