//
//  ViewController.swift
//  Scroll View - Example 4
//
//  Created by Sanket-Sonje on 25/04/21.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: - Variables and Constants

    @IBOutlet weak var scrollView: UIScrollView!
    var imageView = UIImageView()
    @IBOutlet weak var actionButton: UIButton!

    //MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews();
    }

    //MARK: - Setup Views

    func setupViews() {
        setupScrollView();
        setupImageView();
    }

    func setupScrollView() {
        scrollView.delegate = self;
    }

    func setupImageView() {
        imageView.frame = CGRect(
            x: 0,
            y: 0,
            width: scrollView.frame.size.width,
            height: scrollView.frame.size.height)
        imageView.isUserInteractionEnabled = true
        scrollView.addSubview(imageView)
    }

    //MARK: - Setup Image

    @IBAction func loadImageFromGally(_ sender: Any) {
        setupImagePickerController()
    }

    func setupImagePickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self;
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage

        setupImageToScrollView(image: image)
        adjustImageToScrollView()
        centerScrollViewContent()

        picker.dismiss(animated: true, completion: nil)
    }

    func setupImageToScrollView(image: UIImage) {
        imageView.image = image
        imageView.contentMode = .center
        imageView.frame = CGRect(
            x: 0,
            y: 0,
            width: image.size.width,
            height: image.size.height)
        scrollView.contentSize = image.size
    }

    func adjustImageToScrollView() {
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)

        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 1
        scrollView.zoomScale = minScale
    }

    func centerScrollViewContent() {
        let boundSize = scrollView.bounds.size
        var contentFrame = imageView.frame

        // set width
        if contentFrame.size.width < boundSize.width {
            contentFrame.origin.x = (boundSize.width - contentFrame.size.width) / 2
        } else {
            contentFrame.origin.x = 0
        }

        // set height
        if contentFrame.size.height < boundSize.height {
            contentFrame.origin.y = (boundSize.height - contentFrame.size.height) / 2
        } else {
            contentFrame.origin.y = 0
        }

        // set the image frame with content frame
        imageView.frame = contentFrame
    }

    //MARK: - ScrollViewDelegateMethods

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerScrollViewContent()
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
