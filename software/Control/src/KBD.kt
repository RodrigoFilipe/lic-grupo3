import java.time.LocalDateTime
import java.time.LocalTime

object KBD { // Ler teclas. Métodos retornam ‘0’..’9’,’#’,’*’ ou NONE.
    private const val NONE = 0;
    private const val keyboardMask = 0x0F
    private const val kvalMask = 0x10
    private const val kackMask = 0x10
    private var count = 0

    // Inicia a classe
    fun init() {
        HAL.clrBits(kackMask)
    }

    // Retorna de imediato a tecla premida ou NONE se não há tecla premida.
    fun getKey(): Char {

        if(HAL.isBit(kvalMask)){
            val key = HAL.readBits(keyboardMask)

            val c = when(key){
                0x00 -> '1'
                0x01 -> '4'
                0x02 -> '7'
                0x03 -> '*'
                0x04 -> '2'
                0x05 -> '5'
                0x06 -> '8'
                0x07 -> '0'
                0x08 -> '3'
                0x09 -> '6'
                0x0A -> '9'
                0x0B -> '#'
                else -> NONE.toChar()
            }
            if (c != NONE.toChar()){

                if(HAL.isBit(kvalMask)){
                    HAL.setBits(kackMask)
                    val prevTime = LocalTime.now()
                    while(HAL.isBit(kvalMask));
                    val postTime = LocalTime.now()
                    HAL.clrBits(kackMask)
                }
                return c
            }
        }


            return NONE.toChar()

    }
    // Retorna a tecla premida, caso ocorra antes do ‘timeout’ (representado em milissegundos), ou
//NONE caso contrário.
    fun waitKey(timeout: Long): Char{
        val prevTime = LocalDateTime.now()
        while (true){
            val currTime = LocalDateTime.now()
            if((currTime - prevTime) == timeout){
                return
            }
        }
        return '0'
    }
}

fun main(){
    HAL.init()
    KBD.init()
    while (true){
        Thread.sleep(10000)
        println(KBD.getKey())
    }
}
