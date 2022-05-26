//
//  ExerciciosCollectionViewCell.swift
//  DesafioLeal
//
//  Created by Marcelo Falcao Costa Filho on 24/05/22.
//

import UIKit
import MaterialComponents

final class ExerciciosCollectionViewCell: MDCBaseCell {
    @IBOutlet weak var nomeExercicioLabel: UILabel!
    @IBOutlet weak var posterExercicioImage: UIImageView!
    @IBOutlet weak var observacaoExericioLabel: UILabel!
    
    override func prepareForReuse() {
        nomeExercicioLabel.text = nil
        posterExercicioImage.image = nil
        observacaoExericioLabel.text = nil
    }
    
    func construirCell(modelo: ExercicioModel) {
        nomeExercicioLabel.text = modelo.nome
        observacaoExericioLabel.text = modelo.observacao
        
        if let url = modelo.poster {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async { [weak self] in
                            self?.posterExercicioImage.image = image
                        }
                    }
                }
            }
        }
    }
}
