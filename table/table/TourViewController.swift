//
//  TourViewController.swift
//  table
//
//  Created by chucola thomes on 01/08/16.
//  Copyright © 2016 appdata. All rights reserved.
//

import UIKit

class TourViewController: UIPageViewController, UIPageViewControllerDataSource{
    
    
    var indexSaved = 0
    var heading = ""
    var imageFile = ""
    var content = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        // Do any additional setup after loading the view.
            let controller  = self.storyboard?.instantiateViewControllerWithIdentifier("firstViewController")
        setViewControllers([controller!], direction: .Forward,
        animated: true, completion: nil)

    }
    

    
    
    
    func viewControllerAtIndex(index: Int) -> UIViewController? {
        if index == NSNotFound || index < 0 {
            return nil
        }
        // Create a new view controller and pass suitable data.
     
        switch  index  {
        case 0:
            let controller = self.storyboard?.instantiateViewControllerWithIdentifier("firstViewController")
            
            return controller
            
        case 1:
            let controller2 = self.storyboard?.instantiateViewControllerWithIdentifier("secondViewController")
            return controller2
            
        case 2:
            let controller3 = self.storyboard?.instantiateViewControllerWithIdentifier("ThirdViewController")
            return controller3
        default:
            break
        }
        return nil }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/* segundo intento de los 2 metodos, hacia adelante y hacia atras
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        var index = (pageViewController as! TourViewController).index
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        var index = (pageViewController as! TourViewController).index
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        
        
        return viewControllerAtIndex(index)
 */


func pageViewController(pageViewController: UIPageViewController,
                       viewControllerAfterViewController viewController: UIViewController) ->UIViewController? {
   // var index = (viewController as! TourViewController).index

    if(indexSaved == 2)
    {
        return nil
    }
    indexSaved = indexSaved + 1
    print("Index saved: \(indexSaved)")
    return viewControllerAtIndex(indexSaved)
}
func pageViewController(pageViewController: UIPageViewController,
                        viewControllerBeforeViewController viewController: UIViewController) ->
    UIViewController? {
       // var index = (viewController as! WalkthroughContentViewController).index
        return nil
        if(indexSaved == 0)
        {
            return nil
        }
        indexSaved = indexSaved - 1
        print("Index saved: \(indexSaved)")
        return viewControllerAtIndex(indexSaved)


}
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


