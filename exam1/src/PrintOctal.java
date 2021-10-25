import java.util.Scanner;

public class PrintOctal {
    private static String octalString = "";
    public static void main(String[] args) {
        Scanner stdin = new Scanner(System.in);
        System.out.print("Enter an integer: ");
        int n = stdin.nextInt();
        n = step(n);
        while (n/8 != 0) n = step(n);
        n = step(n);
        System.out.println("Octal: " + octalString);
    }

    private static int step(int n) {
        int o = n;
        n = (int) Math.floor((double)n/8.0);
        System.out.printf("%d/8 = %d, Remainder = %d (%s)\n", o, n, o%16, Integer.toOctalString(o%8));
        octalString = Integer.toOctalString(o%8) + octalString;
        return n;
    }
}
