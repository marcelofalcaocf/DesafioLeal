//
//  ViewController.swift
//  DesafioLeal
//
//  Created by Marcelo Falcao Costa Filho on 24/05/22.
//

import UIKit

final class TreinosViewController: UIViewController {
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var treinosCollectionView: UICollectionView!
    
    var treinos: [TreinoModel] = []
    var treinoSelecionado: TreinoModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        criarTreinos()
        treinosCollectionView.dataSource = self
        treinosCollectionView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let exerciciosViewController = segue.destination as? ExerciciosViewController {
            exerciciosViewController.treinoSelectionado = treinoSelecionado
        }
    }
}

extension TreinosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return treinos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TreinosCollectionViewCell
        cell.construirCell(modelo: treinos[indexPath.item])
        return cell
    }
}

extension TreinosViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        treinoSelecionado = treinos[indexPath.item]
        performSegue(withIdentifier: "segue", sender: self)
    }
}

extension TreinosViewController {
    private func criarTreinos() {
        let treinoPeitoral = TreinoModel(
            nome: "Peito",
            data: Date(),
            imagemURL: URL(string: "https://homemnoespelho.com.br/wp-content/uploads/2017/03/Homem-No-Espelho-Treino-de-peito-academia-12.jpg"),
            descricao: "O treino de peito é essencialmente composto pelo treino muscular do músculo peitoral, um músculo de grande volume e que quando em hipertrofia confere beleza em termos estéticos.",
            exercicios: [
                ExercicioModel(
                    nome: "Crossover",
                    poster: URL(string: "https://blog.lionfitness.com.br/wp-content/uploads/2018/10/crossover-lion-fitness.jpg"),
                    observacao: "O crossover é um exercício que estimula o crescimento do peitoral e as áreas afins. Normalmente, é usado para trabalhar o peitoral inferior. Este exercício que por ser com cabos, possibilita algumas vantagens que estabilizam e diminuem o recrutamento de músculos estabilizadores."
                ),
                ExercicioModel(
                    nome: "Supino Declinado",
                    poster: URL(string: "https://www.hipertrofia.org/blog/wp-content/uploads/2018/09/supino-declinado-com-barra.jpg"),
                    observacao: "Por utilizar a porção com mais fibras do peitoral, o supino declinado permite cargas um pouco maiores, quando comparado a versão inclinada. Com esta carga um pouco maior, podemos manipular as variáveis para ter diferentes resultados."
                ),
                ExercicioModel(
                    nome: "Supino Reto",
                    poster: URL(string: "https://www.musculacao.net/wp-content/uploads/2014/05/supino-com-barra.jpg"),
                    observacao: "Dentre os principais benefícios ao se fazer o Supino reto estão o aumento da força e potência muscular para quem busca performance e o ganho de massa muscular nos membros superiores para quem deseja estética."
                ),
                ExercicioModel(
                    nome: "Crucifixo Inclinado",
                    poster: URL(string: "https://static.movimente.me/media/imgs/exercises/img_210.jpeg"),
                    observacao: "O crucifixo é uma boa opção para quem busca hipertrofia ou uma maior definição do peito. Isso porque os movimentos de adução e abdução dos ombros (abrir e fechar) propostos pelo exercício têm um efeito bastante focado no principal músculo da região, o peitoral maior, contribuindo para um resultado ainda melhor."
                )
            ]
        )
   
        let treinoAbdomen = TreinoModel(
            nome: "Abdômen",
            data: Date(),
            imagemURL: URL(string: "https://1.bp.blogspot.com/-xlqJh3GGnVQ/XiBxYdIwU5I/AAAAAAAADFw/l6RsmVaOtsMIjnwn5vjFg-g4lA61LDShwCLcBGAsYHQ/s1600/treinos-de-core-abdomen-lombar.jpg"),
            descricao: "Os benefícios do abdominal vão além da estética. Esses exercícios auxiliam na sustentação e fortalecimento da coluna. Mas para conquistar a desejada barriga chapada, é preciso combinar exercícios abdominais com aeróbicos. Continue a leitura para saber mais sobre esse assunto.",
            exercicios: [
                ExercicioModel(
                    nome: "Abdominal Supra",
                    poster: URL(string: "https://www.hipertrofia.org/blog/wp-content/uploads/2019/09/treino-abdominal.jpg"),
                    observacao: "O abdominal supra é a versão mais simples do exercício e propõe o fortalecimento da musculatura superior do abdômen. Neste caso, você deve levantar as costas do chão, flexionando o abdômen, mas sem encostar o peito nos joelhos."
                ),
                ExercicioModel(
                    nome: "Abdominal Infra",
                    poster: URL(string: "https://www.fiqueinforma.com/wp-content/uploads/2021/02/Abdominal-inferior.jpg"),
                    observacao: "Um dos grandes benefícios do abdominal infra é a facilidade em realizar o movimento se você tem dificuldade ou desconforto no pescoço durante um abdominal tradicional. Este exercício ativará seus principais músculos abdominais, incluindo os oblíquos externos nas laterais do abdômen."
                ),
                ExercicioModel(
                    nome: "Prancha Abdominal",
                    poster: URL(string: "https://static.atletis.com.br/assets/base/394/8ea/d63/900-473-prancha-abdominal-em-casa.jpg"),
                    observacao: "Como a prancha é um exercício isométrico, ajuda a aumentar a resistência muscular, especialmente do core. O fortalecimento de sua resistência do core o ajudará a manter uma boa postura durante corridas longas, caminhadas, passeios de bicicleta e outras atividades sustentadas."
                ),
                ExercicioModel(
                    nome: "Prancha Lateral",
                    poster: URL(string: "https://boaforma.abril.com.br/wp-content/uploads/sites/2/2016/09/melhores-pranchas-definir-barriga_0.jpg"),
                    observacao: "Se você deseja fortalecer os músculos laterais do abdômen e, como bônus, ajudar a tonificar o braço, a prancha lateral pode ser uma ótima opção. Isso porque esse exercício trabalha especificamente a cintura escapular, o braço, os músculos oblíquos e o quadril."
                )
            ]
        )
        
        let treinoBraco = TreinoModel(
            nome: "Braço",
            data: Date(),
            imagemURL: URL(string: "https://boaforma.abril.com.br/wp-content/uploads/sites/2/2016/10/treino_de_braco_5.jpg"),
            descricao: "O treino de braços, quando feito regularmente, também está associado à diminuição de riscos como bursite e tendinite, e ainda facilita atividades rotineiras como carregar compras, mover móveis e levantar objetos pesados.",
            exercicios: [
                ExercicioModel(
                    nome: "Rosca Martelo",
                    poster: URL(string: "https://static.movimente.me/media/imgs/exercises/img_354.jpeg"),
                    observacao: "A rosca martelo também é um exercício para os bíceps braquiais, com enfoque maior no braquial e no braquiorradial. Com os antebraços em posição neutra, promove a flexão do cúbito, e, devido ao posicionamento dos antebraços, atinge o braquiorradial e o braquial."
                ),
                ExercicioModel(
                    nome: "Rosca Concentrada",
                    poster: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS05iLfUFE35wJElovDwQ6to6y_Ry2GVkgGvA&usqp=CAU"),
                    observacao: "Corrige desequilíbrios Por ser um exercício unilateral, a rosca concentrada permite que a carga e a intensidade sejam trabalhadas igualmente nos dois braços, amenizando possíveis diferenças entre eles. - Dá mais força às puxadas O movimento contribui para o ganho de força do bíceps e da empunhadura das mãos."
                ),
                ExercicioModel(
                    nome: "Tríceps Corda",
                    poster: URL(string: "https://st2.depositphotos.com/1845763/9386/i/950/depositphotos_93862620-stock-photo-triceps-rope-pushdown.jpg"),
                    observacao: "O tríceps corda é um exercício de musculação que trabalha o isolamento da parte de trás do braço, por meio da extensão do cotovelo, e atua em três partes do tríceps ou tríceps braquial, com a cabeça medial, longa e, principalmente, a lateral."
                ),
                ExercicioModel(
                    nome: "Tríceps Francês",
                    poster: URL(string: "https://www.dicasdetreino.com.br/wp-content/uploads/2014/07/treino-de-triceps-iniciante.jpg"),
                    observacao: "O tríceps francês é um exercício simples que resolve facilmente o desconforto de ter um braço fraco e com um pouco de flacidez. Ele promove o desenvolvimento da força e hipertrofia do tríceps, músculo que ocupa toda a parte do braço, entre o cotovelo e o ombro."
                ),
                ExercicioModel(
                    nome: "Elevação Lateral",
                    poster: URL(string: "https://academiaup.fitness/wp-content/uploads/2021/02/elevacao-lateral.jpg"),
                    observacao: "A elevação lateral com halteres é um exercício ideal para o fortalecimento dos músculos dos ombros além de melhorar a postura do atleta. Ou seja, não é útil somente para deixar os músculos mais torneados, que servem para os exercícios que utilizam os ombros."
                ),
                ExercicioModel(
                    nome: "Desenvolvimento Arnold",
                    poster: URL(string: "https://www.mundoboaforma.com.br/wp-content/uploads/2022/02/desenvolvimento-1.jpg"),
                    observacao: "Executar de maneira correta o desenvolvimento Arnold contribui para um melhor estímulo muscular, tornando o treino mais produtivo, assim como também minimiza o risco de lesões, tornando a atividade mais segura."
                )
            ]
        )
        
        let treinoCostas = TreinoModel(
            nome: "Costas",
            data: Date(),
            imagemURL: URL(string: "https://www.dicasdetreino.com.br/wp-content/uploads/2017/11/Construindo-Costa-Largas-Treino-completo-ara-Costas-696x483.jpg"),
            descricao: "Um bom treino de costas oferece para além dos aspetos estéticos, um bom alicerce para o desenvolvimento de outras musculaturas do corpo humano, assim como uma estabilidade central capaz de prevenir lesões e de aumentar a performance global do indivíduo nas tarefas do dia-a-dia.",
            exercicios: [
                ExercicioModel(
                    nome: "Puxada Aberta No Pulley",
                    poster: URL(string: "https://blog.lionfitness.com.br/wp-content/uploads/2018/11/Puxada-alta-descubra-como-conquistar-costas-definidas.jpg"),
                    observacao: "O principal objetivo ao utilizar o pulley frente no treino é trabalhar os músculos da dorsal, portanto durante o movimento é necessário focar na contração e alongamento deste grupo muscular."
                ),
                ExercicioModel(
                    nome: "Remada Com Corda Na Polia",
                    poster: URL(string: "https://www.hipertrofia.org/blog/wp-content/uploads/2019/09/elevao-lateral-cabo.jpg"),
                    observacao: "A remada alta é um movimento muito comum no treino de musculação e tem como objetivo trabalhar os deltoides (ombros) e trapézio."
                ),
                ExercicioModel(
                    nome: "Voador Dorsal",
                    poster: URL(string: "https://www.hipertrofia.org/blog/wp-content/uploads/2018/11/crucifixo-invertido-no-peck-deck.jpg"),
                    observacao: "Este exercício trabalha os deltóides, principalmente o feixe posterior. Deve ser observado que, no final do movimento, no momento da aproximação das escapulas, são solicitados o trapézio (porções média e inferior) e o rombóide."
                ),
                ExercicioModel(
                    nome: "Remada Unilateral Apoiada no Banco",
                    poster: URL(string: "https://www.origym.com.br/upload/remada-unilateral-3.png"),
                    observacao: "Este tipo de movimento permite maior concentração de esforço no músculo que você quer trabalhar, recrutando mais fibras musculares do mesmo para a execução do movimento. Além disso, movimentos unilaterais permitem compensar eventuais desequilíbrios de força e tamanho dos músculos entre um lado e outro do corpo."
                )
            ]
        )
        
        let treinoPernas = TreinoModel(
            nome: "Pernas",
            data: Date(),
            imagemURL: URL(string: "https://www.bodynutry.ind.br/images/noticias/grd/ccf502dcaba839adcb55cb5a59581d7e.jpg"),
            descricao: "O treino de pernas desenvolve a força simétrica muscular. Essa simetria oferece maior equilíbrio e previne lesões nos músculos, nos tendões, nas articulações, nos ligamentos e nos ossos.",
            exercicios: [
                ExercicioModel(
                    nome: "Agachamento Livre",
                    poster: URL(string: "https://static.atletis.com.br/assets/base/7ca/57a/9f8/agachamento-barra-livre.jpg"),
                    observacao: "O agachamento fortalece pernas e glúteos. Um dos benefícios do agachamento tem a ver, obviamente, com fortalecimento: é um exercício incrivelmente eficaz para tonificar glúteos, coxas e até panturrilhas."
                ),
                ExercicioModel(
                    nome: "Leg Press",
                    poster: URL(string: "https://img.freepik.com/fotos-gratis/fisiculturista-forte-e-musculoso-fazendo-um-exercicio-de-leg-press-sentado-em-uma-academia_144962-14482.jpg"),
                    observacao: "Ajuda na reabilitação de movimentos O leg press pode beneficiar pessoas idosas ou que tenham algumas limitações, uma vez que contribui para melhorar a funcionalidade do movimento de caminhada e também de sentar e levantar."
                ),
                ExercicioModel(
                    nome: "Avanço Com Halteres",
                    poster: URL(string: "https://network.grupoabril.com.br/wp-content/uploads/sites/2/2016/10/treino_funcional_com_halter_2.jpg?quality=90&strip=info"),
                    observacao: "O avanço, ou passada, como preferir, é um dos exercícios mais intensos e eficientes do treino de pernas, fundamental para a construção de volume e densidade muscular nesta região. Além disso, ele é uma excelente alternativa para pessoas com alguns problemas na coluna ou que queiram um estímulo diferente."
                ),
                ExercicioModel(
                    nome: "Extensão De Perna",
                    poster: URL(string: "https://fitpeople.com/pt/wp-content/uploads/2020/02/extensao-das-perna.jpg"),
                    observacao: "O exercício de extensão de joelho favorece o fortalecimento do músculo da coxa, o quadríceps femural. Esse tipo de exercício favorece o fortalecimento do músculo da coxa, o quadríceps femural. Na cadeira, as costas devem estar ligeiramente inclinadas, não exatamente a 90°."
                ),
                ExercicioModel(
                    nome: "Deadlift Romeno",
                    poster: URL(string: "https://www.espaco360med.com.br/images/blog/main/large/10-fatos-que-farao-voce-incluir-o-levantamento-terra-no-seu-treino-.jpg"),
                    observacao: "O movimento DeadLift consiste em segurar e levantar uma carga até a posição final com o corpo totalmente ereto. Abrange ativação global dos músculos do todo o corpo começando com quadríceps, pernas, posteriores, glúteo e lombar, passando pelo trapézio, costas e antebraços."
                ),
                ExercicioModel(
                    nome: "Cadeira Flexora",
                    poster: URL(string: "https://omundohipoteticodedaniela.files.wordpress.com/2013/12/gabriela-markus-miss-brasil-2012-cadeira-flexora-1364245843407_956x500.jpg"),
                    observacao: "Conforme você abaixa os pés, a resistência muda ligeiramente, o que trabalha suas nádegas ( músculos glúteos ), coxas (quadríceps) e a frente das canelas (tibial anterior). Ter isquiotibiais fortes e flexíveis é um fator importante para sua força, equilíbrio e resistência geral."
                )
            ]
        )
        
        treinos = [treinoPeitoral, treinoAbdomen, treinoBraco, treinoCostas, treinoPernas]
    }
}
