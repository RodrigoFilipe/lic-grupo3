import isel.leic.UsbPort


object HAL { // Virtualiza o acesso ao sistema UsbPort

    var prev_state: Int = 0
    // Inicia a classe
    fun init() {
        prev_state = 0
        UsbPort.write(prev_state)
    }
    // Retorna true se o bit tiver o valor lógico ‘1’
    fun isBit(mask: Int): Boolean {
        var value = UsbPort.read()
        value = value and mask
        if ( value == mask) {
            return true
        }
        return false


    }
    // Retorna os valores dos bits representados por mask presentes no UsbPort
    fun readBits(mask: Int): Int {
        var value = UsbPort.read()
        value = value and mask
        return value

    }
    // Escreve nos bits representados por mask os valores dos bits correspondentes em value
    fun writeBits(mask: Int, value: Int) {
        prev_state = (prev_state and mask.inv()) or (mask and value)
        UsbPort.write(prev_state)


    }
    // Coloca os bits representados por mask no valor lógico ‘1’
    fun setBits(mask: Int) {
        prev_state = prev_state or mask
        UsbPort.write(prev_state)
    }
    // Coloca os bits representados por mask no valor lógico ‘0’
    fun clrBits(mask: Int) {
        prev_state = prev_state and (mask.inv())
        UsbPort.write(prev_state)
    }


}
fun main() {
    HAL.init()
    while(true){
        HAL.setBits(0xCC)
        Thread.sleep(2000)
        HAL.writeBits(0x66, 0x33)
        Thread.sleep(2000)
        HAL.setBits(0x3C)
        Thread.sleep(2000)
        HAL.clrBits(0x99)
        Thread.sleep(2000)

    }

}