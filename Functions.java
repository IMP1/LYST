package lyst.lang;

public class Functions {

    private static final String DEFAULT_JOIN_STRING = "\n";

    public static String join (String value, ArrayList<T> c) {
        StringBuilder result = new StringBuilder(c.get(0));
        for (int i = 1; i < c.size(); i ++) {
            result.append(value);
            result.append(c.get(i).toString());
        }
        return result.toString();
    }

    public static String join (ArrayList<T> c) {
        return join(DEFAULT_JOIN_STRING, c);
    }
    
    public static ArrayList<U> map (ArrayList<T> c, Callable<U> func) {
        ArrayList<U> result = new ArrayList<U>();
        for (int i = 0; i < c.size(); i ++) {
            result.append( func.call(c.get(i)) );
        }
        return result;
    }

    public static ArrayList<Integer> init (int n) {
        ArrayList<Integer> result = new ArrayList<Integer>();
        for (int i = 0; i < n; i ++) {
            result.add(i);
        }
        return result;
    }

    public static Object input () {
        if (State.args.length == 1) {
            return State.args[0];
        } else {
            return State.args;
        }
    }

    public static int product (int a, int b) {
        return a * b;
    }

    public static double product (double a, int b) {
        return a * b;
    }

    public static double product (int a, double b) {
        return a * b;
    }

    public static double product (double a, double b) {
        return a * b;
    }

    public static double product (ArrayList<Double> collection) {
        double result = 1;
        for (double value : c) {
            result *= value;
        }
        return result;
    }

    public static double product (ArrayList<Integer> collection) {
        int result = 1;
        for (int value : c) {
            result *= value;
        }
        return result;
    }

    public static int increment (int n) {
        return n + 1;
    }

    public static double increment (int n) {
        return n + 1;
    }

    public static ArrayList<Integer> increment (ArrayList<Integer> collection) {
        ArrayList<Integer> result = new ArrayList<Integer>();
        for (int n : collection) {
            result.append(n + 1);
        }
        return result;
    }

    public static ArrayList<Double> increment (ArrayList<Double> collection) {
        ArrayList<Double> result = new ArrayList<Double>();
        for (double n : collection) {
            result.append(n + 1);
        }
        return result;
    }

    public static Object current () {
        return State.currentValue();
    }


    public static int output (int value) {
        System.out.print(value);
        return value;
    }

    public static double output (double value) {
        System.out.print(value);
        return value;
    }

    public static String output (String value) {
        System.out.print(value);
        return value;
    }

    public static <T> ArrayList<T> output (ArrayList<T> c) {
        for (T value : c) {
            System.out.print(value);
        }
        return c;
    }

}

public class State {
    
    public static int currentIndex;
    public static Object[] currentValue;

    public static Object args;


}