public class JniTest {
    static {
        System.loadLibrary("JniTest");
    }

    public native int showString(String message);

    public static void main(String[] args) {
        JniTest jt = new JniTest();
        jt.showString("Hello, world");
        int returnedResult = jt.showString("JNI is great");
        System.out.println("returnedResult = " + returnedResult);
    }
}
