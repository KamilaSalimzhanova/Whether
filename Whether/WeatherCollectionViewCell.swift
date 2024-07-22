import UIKit
class WeatherCollectionViewCell: UICollectionViewCell {
    var weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var weatherType: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = label.font.withSize(12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [
            weatherImage,
            weatherType,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            weatherImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            weatherImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            weatherImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            weatherImage.bottomAnchor.constraint(equalTo: weatherType.topAnchor, constant: 0),
            
            weatherType.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            weatherType.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            weatherType.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 10),
            weatherType.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            weatherType.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
