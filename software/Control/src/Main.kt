import isel.leic.UsbPort

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

