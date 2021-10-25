import java.util.Locale;
import java.util.Scanner;

public class PrintHexToDecimal {
    public static void main(String[] args) {
        Scanner stdin = new Scanner(System.in);
        System.out.print("Enter an hexadecimal string: ");
        String input = stdin.next();
        char[] parts = input.toCharArray();
        int exponent = parts.length-1;
        int decimal = 0;
        for(char c : parts) { // This will print in reverse order!
            int a = Integer.parseInt(String.valueOf(c), 16);
            int result = (int) (a * Math.pow(16, exponent));
            System.out.printf("%c = %d(16^%d) = %d\n", c, a, exponent, result);
            decimal += result;
            exponent--;
        }

        System.out.println("Octal: " + decimal);
    }
}
