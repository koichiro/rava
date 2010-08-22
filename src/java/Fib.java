
public class Fib {
    public static int fib(int n) {
	if (n <= 1)
	    return n;
	else
	    return fib(n - 1) + fib(n - 2);
    }

    public static void main(String[] args) {
	int n = 10;
	int r = 0;
	for (int i = 1; i <= n; i++) {
	    r = fib(i);
	}
    }
}
