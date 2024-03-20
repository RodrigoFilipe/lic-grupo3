import HAL

object LCD { // Escreve no LCD usando a interface a 4 bits.
    // Dimensão do display.
    private const val LINES = 2
    private const val COLS = 16
    private val maskDlow = 0x0F
    private val maskDhigh = 0xF0
    private val maskRS = 0x40
    private val maskE = 0x20
    private val maskClk = 0x10
    private val parallelmask = 0x1F

    // Escreve um byte de comando/dados no LCD em paralelo
    private fun writeByteParallel(rs: Boolean, data: Int){
            HAL.clrBits(maskClk)
            //write high
            var byte = data shr 4
            byte = byte.or(maskClk)
            HAL.writeBits(0x1F, byte)
            HAL.clrBits(maskClk)
            //write low
            byte = data.and(maskDlow)
            byte = byte.or(maskClk)
            HAL.writeBits(0x1F, byte)
            HAL.clrBits(maskClk)

            if(rs){
                HAL.setBits(maskRS)
            } else{
                HAL.clrBits(maskRS)
            }


            Thread.sleep(1)
            HAL.setBits(maskE)
            Thread.sleep(1)
            HAL.clrBits(maskE)



    }
    // Escreve um byte de comando/dados no LCD em série
    private fun writeByteSerial(rs: Boolean, data: Int){
        TODO()
    }
    // Escreve um byte de comando/dados no LCD
    private fun writeByte(rs: Boolean, data: Int) {
        writeByteParallel(rs, data)
    }
    // Escreve um comando no LCD
    private fun writeCMD(data: Int) {
        writeByte(false, data)
    }
    // Escreve um dado no LCD
    private fun writeDATA(data: Int) {
        writeByte(true, data)
    }
    // Envia a sequência de iniciação para comunicação a 4 bits.
    fun init() {
        Thread.sleep(500)
        writeCMD(0x30)
        Thread.sleep(500)
        writeCMD(0x30)
        Thread.sleep(500)
        writeCMD(0x30)
        Thread.sleep(0x30)
        writeCMD(0x38)
        Thread.sleep(500)
        writeCMD(0x08)
        Thread.sleep(500)
        writeCMD(0x01)
        Thread.sleep(500)
        writeCMD(0x06)
        Thread.sleep(500)

    }
    // Escreve um caráter na posição corrente.
    fun write(c: Char) {
        writeDATA(c.code)
    }
    // Escreve uma string na posição corrente.
    fun write(text: String) {

    }
    // Envia comando para posicionar cursor (‘line’:0..LINES-1 , ‘column’:0..COLS-1)
    fun cursor(line: Int, column: Int) {

    }
    // Envia comando para limpar o ecrã e posicionar o cursor em (0,0)
    fun clear() {

    }
}

fun main(){
    LCD.init()
    LCD.write('a')
}