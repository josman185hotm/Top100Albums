//
//  AlbumDetail.swift
//  Top100Albums
//
//  Created by Jose Vargas on 14/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

class AlbumDetail: UIView {
    
    // MARK: - Properties
    var iTunesButtonAction: (() -> Void)?
    
    let albumImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let copyrightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        label.numberOfLines = 0
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    let albumLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = .pinkGen
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 19, weight: .light)
        label.textAlignment = .right
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    let itunesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("iTunes Preview", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .pinkGen
        return button
    }()
    
    // MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setSubViews()
        self.setConstraints()
        addiTunesButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(detail: AlbumViewModel?) {
        albumImage.loadImage(detail?.artworkUrl100)
        copyrightLabel.text = detail?.copyright
        albumLabel.text = detail?.name
        artistLabel.text = detail?.artistName
        genreLabel.text = detail?.genres.first?.name
        releaseDateLabel.text = detail?.releaseDate
    }
    
    // MARK: - setUI
    fileprivate func setSubViews() {
        self.backgroundColor = .white
        self.addSubview(albumImage)
        self.addSubview(copyrightLabel)
        self.addSubview(albumLabel)
        self.addSubview(artistLabel)
        self.addSubview(genreLabel)
        self.addSubview(releaseDateLabel)
        self.addSubview(itunesButton)
    }
    
    fileprivate func setConstraints() {
        self.setAlbumImageViewConstrainst()
        self.setCopyrightLabelConstraints()
        self.setAlbumLabelConstraints()
        self.setArtistLabelConstraints()
        self.setGenderLabelConstraints()
        self.setReleaseDateLabelConstraints()
        self.setiTunesButtonConstraints()
    }
    
    // MARK: - Constraints
    fileprivate func setAlbumImageViewConstrainst() {
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        albumImage.contentMode = .scaleAspectFit
        albumImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        albumImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        albumImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        albumImage.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setCopyrightLabelConstraints() {
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightLabel.leftAnchor.constraint(equalTo: self.albumImage.leftAnchor, constant: 0).isActive = true
        copyrightLabel.rightAnchor.constraint(equalTo: self.albumImage.rightAnchor, constant: 0).isActive = true
        copyrightLabel.topAnchor.constraint(equalTo: self.albumImage.bottomAnchor, constant: 10).isActive = true
    }
    
    fileprivate func setAlbumLabelConstraints() {
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.leftAnchor.constraint(equalTo: albumImage.leftAnchor, constant: 5).isActive = true
        albumLabel.rightAnchor.constraint(equalTo: albumImage.rightAnchor, constant: 0).isActive = true
        albumLabel.topAnchor.constraint(equalTo: copyrightLabel.bottomAnchor, constant: 40).isActive = true
    }
    
    fileprivate func setArtistLabelConstraints() {
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.leftAnchor.constraint(equalTo: albumImage.leftAnchor, constant: 5).isActive = true
        artistLabel.rightAnchor.constraint(equalTo: albumImage.rightAnchor, constant: -5).isActive = true
        artistLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setGenderLabelConstraints() {
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.leftAnchor.constraint(equalTo: self.albumImage.leftAnchor, constant: 5).isActive = true
        genreLabel.rightAnchor.constraint(equalTo: self.albumImage.rightAnchor, constant: -5).isActive = true
        genreLabel.topAnchor.constraint(equalTo: self.artistLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    fileprivate func setReleaseDateLabelConstraints() {
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.leftAnchor.constraint(equalTo: self.albumImage.leftAnchor, constant: 5).isActive = true
        releaseDateLabel.rightAnchor.constraint(equalTo: self.albumImage.rightAnchor, constant: -5).isActive = true
        releaseDateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    fileprivate func setiTunesButtonConstraints() {
        itunesButton.translatesAutoresizingMaskIntoConstraints = false
        itunesButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        itunesButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        itunesButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        itunesButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        itunesButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    // MARK: - Actions
    func addiTunesButtonAction() {
        itunesButton.addTarget(self, action: #selector(buttonitunesPressed), for: .touchUpInside)
    }
    
    @objc func buttonitunesPressed() {
        iTunesButtonAction?()
    }
}
