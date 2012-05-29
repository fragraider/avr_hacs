/** @file 
 * @author Mariya */

#include <stdio.h>
#include <stdint.h>
#include <avr/io.h>


/**
 * @brief Read key pressed
 *
 * The read_key() function is, as we can see, responsible for
 * reading the information about which button has been pressed.
 * The function will block the processor until a key is pressed.
 * 
 * The char that is finally returned is in the ascii standard.
 * 
 * Then comes our main() function where we simply return the
 * result of the key press.
 * 
 * 
 * @author Mariya
 */

char read_key() {

uint8_t key = 31;

	while(key == 31) { 
		key = 0;
		if(PINA&_BV(0)) { key += 1; }
		if(PINA&_BV(1)) { key += 2; }
		if(PINC&_BV(6)) { key += 4; }
		if(PINC&_BV(7)) { key += 8; }
		if(PIND&_BV(6)) { key += 16; }
 	}

		//if(key == 31) { key = key - 31; }
	
		if(key <= 9 && key >= 0) { key = key + 48; }

		if(key <= 15 && key >= 10) { key = key + 55; }

return(char) key;
}

int main(){

char returned_key;

	returned_key = read_key();

}
