//
//  TreinosCollectionViewCell.swift
//  DesafioLeal
//
//  Created by Marcelo Falcao Costa Filho on 24/05/22.
//

import UIKit
import MaterialComponents

final class TreinosCollectionViewCell: MDCBaseCell {
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImage.contentMode = .scaleAspectFill
        descricaoLabel.numberOfLines = 0
    }
    
    override func prepareForReuse() {
        nomeLabel.text = nil
        posterImage.image = nil
        descricaoLabel.text = nil
    }
    
    func construirCell(modelo: TreinoModel) {
        nomeLabel.text = modelo.nome
        descricaoLabel.text = modelo.descricao
        
        if let url = modelo.imagemURL {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async { [weak self] in
                            self?.posterImage.image = image
                        }
                    }
                }
            }
        }
    }
}
