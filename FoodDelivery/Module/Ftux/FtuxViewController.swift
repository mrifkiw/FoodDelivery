//
//  FtuxViewController.swift
//  FoodDelivery
//
//  Created by Muhammad Rifki Widadi on 06/01/23.
//

import UIKit

struct OnboardingDetail {
    let title: String
    let subtitle: String
}

class FtuxViewController: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!

    var arrScreen: [OnboardingDetail] = [
        OnboardingDetail(title: "Find Food You Love", subtitle: "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"),
        OnboardingDetail(title: "Fast Delivery", subtitle: "Fast food delivery to your home, office wherever you are"),
        OnboardingDetail(title: "Live Tracking", subtitle: "Real time tracking of your food on the app once you placed the order")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }


    func setup() {
        nextBtn.layer.cornerRadius = 28
        nextBtn.layer.masksToBounds = true
    }

    fileprivate func setupScreenContent(onPage index: Int) {
        titleLabel.text = arrScreen[index].title
        subtitleLabel.text = arrScreen[index].subtitle
        imageView.image = UIImage(named: "img_ftux_\(index + 1)")
    }

    @IBAction func nextBtnTapped(_ sender: UIButton) {
        pageControl.currentPage += 1

        if pageControl.currentPage == pageControl.numberOfPages - 1 {
            nextBtn.setTitle("Let's start", for: .normal)
        } else {
            nextBtn.setTitle("Next", for: .normal)
        }

        setupScreenContent(onPage: pageControl.currentPage)
    }

    @IBAction func pageControlChanges(_ sender: UIPageControl) {
        setupScreenContent(onPage: sender.currentPage)
    }

}
