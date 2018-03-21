////
////  NKDropdownMenu.swift
////  NKDropdownMenuDemo
////
////  Created by Peng on 11/3/15.
////  Copyright © 2015 Peng. All rights reserved.
////
//
//import UIKit
//
//func delay(seconds: Double, completion: ()->()) {
//    let popTime = DispatchTime.now(dispatch_time_t(DispatchTime.now()), Int64( Double(NSEC_PER_SEC) * seconds))
//
//    dispatch_after(popTime, dispatch_get_main_queue()) {
//        completion()
//    }
//}
//
//func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
//    return CGRect(x: x, y: y, width: width, height: height)
//}
//class NKDropdownMenu: UIView {
//
//    var barButtonItemWidth: CGFloat! {
//        get {
//            return self.configuration.barButtonItemWidth
//        }
//        set(value) {
//            self.configuration.barButtonItemWidth = value
//        }
//    }
//
//    var barButtonItemHeight: CGFloat! {
//        get {
//            return self.configuration.barButtonItemHeight
//        }
//        set(value) {
//            self.configuration.barButtonItemHeight = value
//        }
//    }
//
//    var menuCellHeight: CGFloat! {
//        get {
//            return self.configuration.menuCellHeight
//        }
//        set(value) {
//            self.configuration.menuCellHeight = value
//        }
//    }
//
//    var menuCellBackgroundColor: UIColor! {
//        get {
//            return self.configuration.menuCellBackgroundColor
//        }
//        set(value) {
//            self.configuration.menuCellBackgroundColor = value
//        }
//    }
//
//    var menuCellTextLabelColor: UIColor! {
//        get {
//            return self.configuration.menuCellTextLabelColor
//        }
//        set(value) {
//            self.configuration.menuCellTextLabelColor = value
//        }
//    }
//
//    var menuCellTextLabelFont: UIFont! {
//        get {
//            return self.configuration.menuCellTextLabelFont
//        }
//        set(value) {
//            self.configuration.menuCellTextLabelFont = value
//        }
//    }
//
//    var menuCellSelectionColor: UIColor! {
//        get {
//            return self.configuration.menuCellSelectionColor
//        }
//        set(value) {
//            self.configuration.menuCellSelectionColor = value
//        }
//    }
//
//    var lineColor: UIColor! {
//        get {
//            return self.configuration.lineColor
//        }
//        set(value) {
//            self.configuration.lineColor = value
//        }
//    }
//
//    let statusbarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
//
//    var didSelectItemAtIndexHandler: ((_ indexPath: Int) -> ())?
//
//    private var navigationController: UINavigationController?
//    private var configuration = NKDropdownMenuConfiguration()
//    private var items: [String]!
//    private var menuWrapper: UIView!
//    private var backgroundView: UIView!
//    private var hamburgerView: NKHamburgerView!
//    private var linesView: NKDropdownMenuLinesView!
//    private var menuView: NKDropdownMenuTableView!
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder: ) has not been implemented")
//    }
//
//    init(items: [String]) {
//
//        // Navigation controller
//        self.navigationController = UIApplication.shared.keyWindow?.rootViewController?.topMostViewController?.navigationController
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//
//        // init left bar button item
//        let hamburgerMenuFrame = CGRectMake(0.0, 0.0, configuration.barButtonItemWidth, configuration.barButtonItemHeight)
//        super.init(frame: hamburgerMenuFrame)
//        self.hamburgerView = NKHamburgerView(frame: hamburgerMenuFrame)
//        addSubview(self.hamburgerView)
//
//        backgroundColor = .clear
//
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(("showMenu")))
//        addGestureRecognizer(tapGesture)
//
//        self.items = items
//
//        let window = UIApplication.shared.keyWindow!
//        let menuWrapperBounds = window.bounds
//
//        // Set up DropdownMenu
//        self.menuWrapper = UIView(frame: CGRectMake(menuWrapperBounds.origin.x, 0, menuWrapperBounds.width, menuWrapperBounds.height))
//        self.menuWrapper.clipsToBounds = true
//        self.menuWrapper.autoresizingMask = UIViewAutoresizing.flexibleWidth.union(UIViewAutoresizing.flexibleHeight)
//
//        // Init background view (under table view)
//        self.backgroundView = UIView(frame: menuWrapperBounds)
//        self.backgroundView.autoresizingMask = UIViewAutoresizing.flexibleWidth.union(UIViewAutoresizing.flexibleHeight)
//        self.menuWrapper.addSubview(self.backgroundView)
//
//        let menuViewFrame = CGRectMake(0.0, self.statusbarHeight, menuWrapperBounds.width, configuration.menuCellHeight * CGFloat(self.items.count))
//        self.menuView = NKDropdownMenuTableView(frame: menuViewFrame, items: self.items, configuration: NKDropdownMenuConfiguration())
//        self.menuView.selectRowAtIndexPathHandler = { (indexPath: Int) -> () in
//
//            if let didSelecthandler = self.didSelectItemAtIndexHandler {
//                didSelecthandler(indexPath)
//            }
//
//            self.hideMenu()
//        }
//        self.menuWrapper.addSubview(menuView)
//
//        self.linesView = NKDropdownMenuLinesView(frame: CGRectMake(0, statusbarHeight, menuWrapperBounds.width, configuration.menuCellHeight))
//        self.menuWrapper.addSubview(linesView)
//
//        window.addSubview(self.menuWrapper)
//
//        // By default, hide menu view
//        self.menuWrapper.isHidden = true
//    }
//
//    func showMenu() {
//        // hide hamburger lines
//        self.hamburgerView.isHidden = true
//
//        // hide menu table view at first
//        self.menuView.isHidden = true
//
//        // Visible menu view
//        self.menuWrapper.isHidden = false
//
//        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: { () -> Void in
//
//            self.linesView.topLine.frame.origin.x = 0.0
//            self.linesView.middleLine.frame.origin.x = 0.0
//            self.linesView.bottomLine.frame.origin.x = 0.0
//
//            self.linesView.topLine.frame.size.width = self.linesView.frame.size.width
//            self.linesView.middleLine.frame.size.width = self.linesView.frame.size.width
//            self.linesView.bottomLine.frame.size.width = self.linesView.frame.size.width
//
//            for hiddenLine in self.linesView.hiddenLines {
//                hiddenLine.frame.origin.x = 0.0
//                hiddenLine.frame.size.width = self.linesView.frame.size.width
//            }
//
//            }, completion: nil)
//
//        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: { () -> Void in
//
//            self.linesView.frame.size.height = 3 * self.configuration.menuCellHeight
//
//            self.linesView.topLine.frame.origin.y = self.configuration.menuCellHeight - 1.0 // seperator height
//            self.linesView.middleLine.frame.origin.y = 2 * self.configuration.menuCellHeight - 1.0
//            self.linesView.bottomLine.frame.origin.y = 3 * self.configuration.menuCellHeight - 1.0
//
//            for (index, hiddenLine) in self.linesView.hiddenLines.enumerated() {
//                hiddenLine.frame.origin.y = CGFloat(4+index)*self.configuration.menuCellHeight - 1.0
//            }
//
//            }) { _ in
//
//                self.menuView.isHidden = false
//                self.menuView.animate = true
//                self.menuView.reloadData()
//
//                // workaround to cover the flicer when reloadData()
//                delay(seconds: 1.0, completion: { () -> () in
//                    self.linesView.alpha = 0.0
//
//                })
//
//        }
//    }
//
//    func hideMenu() {
//
//        UIView.animate(withDuration: 0.5, animations: { () -> Void in
//
//            for cell in self.menuView.visibleCells {
//
//                cell.frame.origin.x -= 10
//                cell.textLabel?.alpha = 0
//
//            }
//
//            }, completion: nil)
//
//        UIView.animateKeyframes(withDuration: 0.5, delay: 1.0, options: [], animations: { () -> Void in
//
//            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.01, animations: { () -> Void in
//                self.menuView.alpha = 0.0
//                self.linesView.alpha = 1.0
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 0.01, relativeDuration: 1, animations: { () -> Void in
//
//                self.linesView.topLine.frame = CGRectMake(16.0, 7.0 + self.configuration.barButtonItemHeight / 4, self.configuration.barButtonItemWidth, 1.0)
//                self.linesView.middleLine.frame = CGRectMake(16.0, 7.0 + self.configuration.barButtonItemHeight / 2, self.configuration.barButtonItemWidth, 1.0)
//                self.linesView.bottomLine.frame = CGRectMake(16.0, 7.0 + self.configuration.barButtonItemHeight*3 / 4, self.configuration.barButtonItemWidth, 1.0)
//
//                for hiddenLine in self.linesView.hiddenLines {
//                    hiddenLine.frame = CGRectMake(16.0, 7.0 + self.configuration.barButtonItemHeight*3 / 4, self.configuration.barButtonItemWidth, 1.0)
//                }
//
//            })
//
//            }, completion: {_ in
//                self.hamburgerView.isHidden = false
//                self.menuView.alpha = 1.0
//                self.menuWrapper.isHidden = true
//        })
//
//    }
//}
//
//public class NKDropdownMenuConfiguration {
//
//    var barButtonItemWidth: CGFloat!
//    var barButtonItemHeight: CGFloat!
//
//    var lineColor: UIColor?
//
//    var menuCellHeight: CGFloat! {
//        didSet {
//            if menuCellHeight < barButtonItemHeight / 4.0 {
//                print("menuCellHeight can't be less than barButtonItemHeight/4.0")
//                menuCellHeight = 44.0
//            }
//
//        }
//
//    }
//    var menuCellBackgroundColor: UIColor?
//    var menuCellTextLabelColor: UIColor?
//    var menuCellTextLabelFont: UIFont!
//    var menuCellSelectionColor: UIColor?
//
//    init() {
//        self.defaultValue()
//    }
//
//    func defaultValue() {
//
//        self.barButtonItemWidth = 30.0
//        self.barButtonItemHeight = 30.0
//        self.menuCellHeight = 52.0
//
//        //DEFAULT INIT MENU BACKGROUND COLOR -- !!
//        self.menuCellBackgroundColor = UIColor(red: 83.0/255.0, green: 53.0/255.0, blue: 87.0/255.0, alpha: 1.0)
//
//        self.lineColor = UIColor(red: 236.0/255.0, green: 114.0/255.0, blue: 99.0/255.0, alpha: 1.0)
//        self.menuCellTextLabelColor = UIColor(red: 236.0/255.0, green: 114.0/255.0, blue: 99.0/255.0, alpha: 1.0)
//        self.menuCellTextLabelFont = UIFont.systemFont(ofSize: 17.0)
//        self.menuCellSelectionColor = UIColor(red: 87.0/255.0, green: 56.0/255.0, blue: 92.0/255.0, alpha: 1.0)
//
//    }
//}
//
//class NKHamburgerView: UIView {
//
//    var configuration = NKDropdownMenuConfiguration()
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder: ) has not been implemented")
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        let topLine: UIView = UIView(frame: CGRectMake(0, bounds.size.height / 4, bounds.size.width, 1.0))
//        topLine.backgroundColor = configuration.lineColor
//        addSubview(topLine)
//
//        let middleLine: UIView = UIView(frame: CGRectMake(0, bounds.size.height / 2, bounds.size.width, 1.0))
//        middleLine.backgroundColor = configuration.lineColor
//        addSubview(middleLine)
//
//        let bottomLine: UIView = UIView(frame: CGRectMake(0, bounds.size.height*3 / 4, bounds.size.width, 1.0))
//        bottomLine.backgroundColor = configuration.lineColor
//        addSubview(bottomLine)
//
//    }
//
//}
//
//class NKDropdownMenuLinesView: UIView {
//
//    let topLine: UIView = UIView()
//    let middleLine: UIView = UIView()
//    let bottomLine: UIView = UIView()
//
//    var hiddenLines: [UIView] = [UIView]()
//    var configuration = NKDropdownMenuConfiguration()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        topLine.frame = CGRectMake(16.0, 7.0 + configuration.barButtonItemHeight / 4, configuration.barButtonItemWidth, 1.0)
//        topLine.backgroundColor = configuration.lineColor
//        self.addSubview(topLine)
//
//        middleLine.frame = CGRectMake(16.0, 7.0 + configuration.barButtonItemHeight / 2, configuration.barButtonItemWidth, 1.0)
//        middleLine.backgroundColor = configuration.lineColor
//        self.addSubview(middleLine)
//
//        bottomLine.frame = CGRectMake(16.0, 7.0 + configuration.barButtonItemHeight*3 / 4, configuration.barButtonItemWidth, 1.0)
//        bottomLine.backgroundColor = configuration.lineColor
//        self.addSubview(bottomLine)
//
//        let hiddenLine1: UIView = UIView(frame: CGRectMake(16.0, 7.0 + configuration.barButtonItemHeight*3 / 4, configuration.barButtonItemWidth, 1.0))
//        hiddenLine1.backgroundColor = configuration.lineColor
//        hiddenLines.append(hiddenLine1)
//        self.addSubview(hiddenLine1)
//
//        let hiddenLine2: UIView = UIView(frame: CGRectMake(16.0, 7.0 + configuration.barButtonItemHeight*3 / 4, configuration.barButtonItemWidth, 1.0))
//        hiddenLine2.backgroundColor = configuration.lineColor
//        hiddenLines.append(hiddenLine2)
//        self.addSubview(hiddenLine2)
//
//        self.backgroundColor = UIColor.clear
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder: ) has not been implemented")
//    }
//}
//
//
//class NKDropdownMenuTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//    let statusbarHeight = UIApplication.shared.statusBarFrame.size.height
//    let screenWidth = UIScreen.main.bounds.size.width
//
//    var configuration: NKDropdownMenuConfiguration!
//    var selectRowAtIndexPathHandler: ((_ indexPath: Int) -> ())?
//
//    var animate: Bool = false
//
//    // Private properties
//    private var items: [String]!
//    private var selectedIndexPath: Int!
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder: ) has not been implemented")
//    }
//
//    init(frame: CGRect, items: [String], configuration: NKDropdownMenuConfiguration) {
//        super.init(frame: frame, style: UITableViewStyle.plain)
//
//        self.items = items
//        self.selectedIndexPath = 0
//        self.configuration = configuration
//
//        // Setup table view
//        self.delegate = self
//        self.dataSource = self
//
//        //CHANGE MENU TABLEVIEW BACKGROUND COLOR HERE -- !!
//
//        self.backgroundColor = UIColor(red: 83.0/255.0, green: 53.0/255.0, blue: 87.0/255.0, alpha: 1.0)
//        self.separatorStyle = UITableViewCellSeparatorStyle.none
//        self.autoresizingMask = UIViewAutoresizing.flexibleWidth
//
//    }
//
//    // Table view data source
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        if self.animate {
//            return self.items.count
//
//        } else {
//            return 0
//        }
//
//    }
//
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return self.configuration.menuCellHeight
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = NKDropdownMenuViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell", configuration: self.configuration)
//
//        cell.textLabel?.text = self.items[indexPath.row]
//        cell.textLabel?.font = self.configuration.menuCellTextLabelFont
//        cell.textLabel?.textColor = self.configuration.menuCellTextLabelColor
//        cell.selectionStyle = .none
//
//        return cell
//    }
//
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//
//        cell.separatorInset = UIEdgeInsets.zero
//        cell.preservesSuperviewLayoutMargins = false
//        cell.layoutMargins = UIEdgeInsets.zero
//
//        //CHANGE MENU TABLEVIEW CELL BACKGROUND COLOR HERE -- !!
//
//        cell.backgroundColor = UIColor.clear
//
//        if animate {
//
//            cell.alpha = 0
//
//            let originalRect: CGRect = tableView.rectForRow(at: indexPath as IndexPath)
//
//            cell.frame = CGRectMake(cell.frame.origin.x - 10.0, cell.frame.origin.y, cell.frame.size.width + 10.0, cell.frame.size.height)
//            cell.textLabel?.alpha = 0
//
//            UIView.animate(withDuration: 0.2, delay: 0.2, options: [], animations: { () -> Void in
//
//                cell.alpha = 1.0
//                }, completion: nil)
//
//            UIView.animate(withDuration: 0.2, delay: 0.2, options: [], animations: { () -> Void in
//
//                cell.textLabel?.alpha = 1.0
//                cell.frame = originalRect
//
//                }, completion: { _ in
//
//                    cell.frame = CGRectMake(originalRect.origin.x, originalRect.origin.y, originalRect.size.width + 10.0, originalRect.size.height)
//            })
//
//        }
//    }
//
//    // Table view delegate
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        selectedIndexPath = indexPath.row
//        self.selectRowAtIndexPathHandler!(indexPath.row)
//        let cell = tableView.cellForRow(at: indexPath as IndexPath) as? NKDropdownMenuViewCell
//
//        UIView.animate(withDuration: 0.1, animations: { () -> Void in
//            cell?.contentView.backgroundColor = self.configuration.menuCellSelectionColor
//            }) { _ in
//                cell?.contentView.backgroundColor = UIColor.clear
//        }
//
//    }
//
//}
//
//class NKDropdownMenuViewCell: UITableViewCell {
//
//    let screenWidth = UIScreen.main.bounds.size.width
//
//    var configuration: NKDropdownMenuConfiguration!
//    var seperator: UIView!
//
//    init(style: UITableViewCellStyle, reuseIdentifier: String?, configuration: NKDropdownMenuConfiguration) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        self.configuration = configuration
//
//        self.seperator = UIView(frame: CGRectMake(0.0, self.configuration.menuCellHeight - 1.0, screenWidth + 10.0, 1.0))
//
//        //CHANGE MENU TABLEVIEW LINE SEPERATOR COLOR HERE -- !!
//
//        self.seperator.backgroundColor = UIColor(red: 236.0/255.0, green: 114.0/255.0, blue: 99.0/255.0, alpha: 1.0)
//
//        self.addSubview(seperator)
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder: ) has not been implemented")
//    }
//
//}
//
//extension UIViewController {
//    // Get ViewController in top present level
//    var topPresentedViewController: UIViewController? {
//        var target: UIViewController? = self
//        while (target?.presentedViewController != nil) {
//            target = target?.presentedViewController
//        }
//        return target
//    }
//
//    // Get top VisibleViewController from ViewController stack in same present level.
//    // It should be visibleViewController if self is a UINavigationController instance
//    // It should be selectedViewController if self is a UITabBarController instance
//    var topVisibleViewController: UIViewController? {
//        if let navigation = self as? UINavigationController {
//            if let visibleViewController = navigation.visibleViewController {
//                return visibleViewController.topVisibleViewController
//            }
//        }
//        if let tab = self as? UITabBarController {
//            if let selectedViewController = tab.selectedViewController {
//                return selectedViewController.topVisibleViewController
//            }
//        }
//        return self
//    }
//
//    // Combine both topPresentedViewController and topVisibleViewController methods, to get top visible viewcontroller in top present level
//    var topMostViewController: UIViewController? {
//        return self.topPresentedViewController?.topVisibleViewController
//    }
//}

