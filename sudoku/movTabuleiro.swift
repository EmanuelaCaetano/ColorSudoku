import Foundation
import Darwin //Para termios

//Variaveis
//Posição cursor
var posLinha : Int = 2
var posColuna : Int = 2
var posLinhaAnterior : Int = 2
var qtdColunasAndadas : Int = 0
//Variavel se jogo está rolando
var isJogoOn = true;


func desligarEnterEPegarCaractere() -> Character{
    var tecla = termios()//Iniciando essa variável com tipo termios (uma struct com as configurações do terminal)
    tcgetattr(STDIN_FILENO, &tecla) // Obtém a configuração atual do terminal através da tcgetattr, que passa como argumento STDIN_FILENO, indicando que refere as configs de terminao de entrada de dados, e &tecla, alterando os dados da var tecla diretamente. Sendo assim a var tecla recebe as configs de entrada do terminal.
    tecla.c_lflag &= ~(UInt(ICANON | ECHO)) // Desativa o modo canônico ICANON (necessidade do enter) e a exibição dos caracteres na tela ECHO
    tcsetattr(STDIN_FILENO, TCSANOW, &tecla) // Aplica as mudanças
    
    let caractere = Character(UnicodeScalar(UInt8(getchar()))) //Tranformar em termio para char
    
    tecla.c_lflag |= UInt(ICANON | ECHO) //Volta as config originais
    tcsetattr(STDIN_FILENO, TCSANOW, &tecla)
    
    return caractere
}

func movCursor(_ posColuna : Int ,_ posLinha : Int ){
    fputs("\u{1B}[\(posColuna);\(posLinha)H", stdout)} //seta o cursor no local da poslinha e poscoluna

func limiteTabuleiroLinha(_ posLinha : Int) -> Int{
    if posLinha <= 2{
        return 2
    }
    else if posLinha >= 12{
        return 12
    }
    return posLinha
}

func limiteTabuleiroColuna(_ posColuna : Int) -> Int{
    if posColuna <= 2{
        return 2
    }
    else if posColuna >= 34{
        return 34
    }
    return posColuna
}

func pulaLinha(_ posLinhaAnterior : Int,_ posLinha :inout Int){
    if (posLinhaAnterior == 4 && posLinha == 5) || (posLinhaAnterior == 8 && posLinha == 9){
        posLinha += 1
    }
    if (posLinhaAnterior == 6 && posLinha == 5) || (posLinhaAnterior == 10 && posLinha == 9){
        posLinha -= 1
    }
}

func movTabuleiro() -> Bool{
    
    while isJogoOn == true {
        
        let caractere : Character = desligarEnterEPegarCaractere()
        var numeroUsuario = Int(String(caractere)) ?? 0
        
        //Variáveis para ajustar o i e j da posiçao do cursor com o da matriz
        var linha : Int = posLinha - 2
        //var coluna : Int = posColuna - (2 + 3*qtdColunasAndadas)
        var coluna : Int = (posColuna - 2) / 4
        
        if posLinha >= 6 && posLinha <= 8{
            linha -= 1
        }
        if posLinha >= 10 && posLinha <= 12 {
            linha = linha - 2
        }
        
        if caractere == "a" || caractere == "d" || caractere == "s" || caractere == "w" || caractere == "p" || caractere == "1" || caractere == "2" || caractere == "3" || caractere == "4" || caractere == "5" || caractere == "6" || caractere == "7" || caractere == "8" || caractere == "9"{
            switch caractere{
            case "a":
                posColuna -= 4
                qtdColunasAndadas -= 1
                break
            case "d":
                posColuna += 4
                qtdColunasAndadas += 1
                break
            case "s":
                posLinhaAnterior = posLinha
                posLinha += 1
                break
            case "w":
                posLinhaAnterior = posLinha
                posLinha -= 1
                break
            case "p":
                return isJogoOn == false
                break
            default:
                if validarEscolhaUsuario(matrizResposta, &matrizUsuario, linha, coluna, numeroUsuario){
                    print(matrizResposta)
                    limparTerminal()
                    printMatrizColorida(matrizUsuario)
                    movTabuleiro()
                    var temZero = 81
                    for i in 0...8{
                        for j in 0...8{
                            if matrizUsuario[i][j] != 0{
                                temZero -= 1
                            }
                        }
                    }
                    if temZero <= 0{
                        TelaVitoria()
                    }
                }
                else{
                    limparTerminal()
                    printMatrizColorida(matrizUsuario)
                    print("\njogada incorreta!")
                    vidas = vidas - 1
                    print("Vidas restantes: \(vidas)")
                    if vidas <= 0 {
                        TelaDerrota()
                    }
                    movTabuleiro()
                }
            }
            posLinha = limiteTabuleiroLinha(posLinha)
            posColuna = limiteTabuleiroColuna(posColuna)
            pulaLinha(posLinhaAnterior, &posLinha)
            movCursor(posLinha , posColuna)
        }
    }
    return isJogoOn == false
}


