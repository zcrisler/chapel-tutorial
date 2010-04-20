use Random;

config const tasks = 2;
config const points_per_task:int(64) = 100000;
config const n:int(64) = tasks * points_per_task; // number of random points to generate
config const seed = 314159265; // random number generator to seed

writeln("Number of tasks           = ", tasks);
writeln("Number of points per task = ", points_per_task);
writeln("Number of points          = ", n);
writeln("Random number seed        = ", seed);

def get_task_count(x) {
    var rs = new RandomStream(seed+(x<<1), parSafe=false);
    var count = 0;
    for i in 1..points_per_task do
        count += rs.getNext()**2 + rs.getNext()**2 <= 1.0;
    delete rs;
    return count;
}

var total: sync int = 0;
coforall i in 1..tasks do
    total += get_task_count(i);

writeln("Approximation of PI = ", format("#.#######", total * 4.0 / n));


