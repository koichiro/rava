
import java.lang.*;
import java.util.*;

class test{
  static int sum = 5;
  public static void main(String args[]){
		test t1 = new test();
		test t2 = new test2();
		int r1  = t1.func(10); // instance
		int r2  = t2.func(10); // inheritance
		int r3  =    test(10); // static
  }
  static int test(int n){
    for(int i=0;i<n;i++){
      sum += i*i; // squre
    }
    return sum;
  }
  int func(int n){
    for(int i=0;i<n;i++){
      sum += i; // ‘«‚µZ
    }
    return sum;
  }
  native static public void out(String str);

}

class test2 extends test{
	int func(int n){
		for(int i=0;i<n;i++){
			sum *=(i+1); // ‚±‚Á‚¿‚ÍŠ|‚¯Z
		}
		return sum;
	}
}



