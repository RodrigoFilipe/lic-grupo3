object SerialEmitter { // Envia tramas para os diferentes módulos Serial Receiver.
    enum class Destination {LCD, SCORE}
    private val LCD_sel = 0x80

    private val SCLK = 0x40
    // Inicia a classe
    fun init(){
        HAL.setBits(LCD_sel)
        HAL.clrBits(SCLK)
    }
// Envia uma trama para o SerialReceiver identificado o destino em addr,os bits de dados em
    //‘data’ e em size o número de bits a enviar.
    fun send(addr: Destination, data: Int, size : Int){
        var parity = 0
        var sendData = data
        val mask = 0x01

        if(addr == Destination.LCD){
            HAL.clrBits(LCD_sel)
            for (i in 0..<size-1){

                HAL.writeBits(mask, sendData)

                if (sendData.and(mask) == 1){
                    parity++
                }
                sendData = sendData.shr(1)

                HAL.setBits(SCLK)
                HAL.clrBits(SCLK)

            }
            HAL.writeBits(mask, parity % 2)
            HAL.setBits(SCLK)
            HAL.clrBits(SCLK)
            HAL.setBits(LCD_sel)
        }





    }
}

fun main(){

}