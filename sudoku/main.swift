
import Foundation

//Variáveis para inicalizaçao do jogo
var dificuldade : Int
var vidas : Int
var matrizResposta : [[Int]] = matrizGabarito()
var matrizUsuario : [[Int]] = [[]]
var isGameOn : Bool

//inicio do jogo
fputs("\u{1B}[8;40;100t", stdout) //limpa terminal

//Menu
var isMenuOn : Bool = true
while isMenuOn == true{
    isGameOn = true
    printMenu()
    printPersonalizado(30, 24, "Escolha uma opção do menu(1 - 5) : ")
    var input : String? = readLine()
    let retornoVal = inputMenu(input)
    switch retornoVal{
    case "D":
        while isGameOn == true{
            dificuldade = 45
            vidas = 20
            matrizUsuario = matrizGame(matrizResposta, dificuldade)
            limparTerminal()
            printMatrizColorida(matrizUsuario)
            isGameOn = movTabuleiro()
        }
    case "M":
        while isGameOn == true{
            dificuldade = 90
            vidas = 10
            matrizUsuario = matrizGame(matrizResposta, dificuldade)
            limparTerminal()
            printMatrizColorida(matrizUsuario)
            isGameOn = movTabuleiro()
        }
    case "F":
        while isGameOn == true{
            dificuldade = 120
            vidas = 5
            matrizUsuario = matrizGame(matrizResposta, dificuldade)
            limparTerminal()
            printMatrizColorida(matrizUsuario)
            isGameOn = movTabuleiro()
        }
    case "A":
        Ajuda()
    case "S":
        print("Voce escolheu Sair!!")
        isMenuOn = false
    default:
        print("Escolha Uma Opção Valida!")
    }
}
