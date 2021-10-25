import java.util.Scanner;

public class PrintHex {
    private static String hexString = "";
    public static void main(String[] args) {
        Scanner stdin = new Scanner(System.in);
        System.out.print("Enter an integer: ");
        int n = stdin.nextInt();
        n = step(n);
        while (n/16 != 0) n = step(n);
        n = step(n);
        System.out.println("Hex: " + hexString);
    }

    private static int step(int n) {
        int o = n;
        n = (int) Math.floor((double)n/16.0);
        System.out.printf("%d/16 = %d, Remainder = %d (%s)\n", o, n, o%16, Integer.toHexString(o%16));
        hexString = Integer.toHexString(o%16) + hexString;
        return n;
    }

}
