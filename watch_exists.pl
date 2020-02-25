#!/usr/bin/perl

# 判断制定文件是否存在，如果不存在就往制定位置记录日志，说明首次发现文件不存在的时间和记录日志的
# 时间。每隔指定时间检查一次
# perl watch_exists.pl --watch=/file.txt --log=/tmp/watch.log --time=60

$watch_file = "/file";
$log_path = "/tmp/watch.log";
$time_wait = 1;

foreach $v (@ARGV) {
    if ($v =~ /^--watch=/) {
        $watch_file = $';
    }
    if ($v =~ /^--log=/) {
        $log_path = $';
    }
    if ($v =~ /^--time=/) {
        $time_wait = $';
    }
}

print "检测文件：$watch_file\n";
print "日志文件：$log_path\n";
print "检测间隔：$time_wait 秒\n";

$first_time = "";

while (1) {
    if (!-f $watch_file) {
        if (!$first_time) {
            $first_time = gmtime();
        }
        $now = gmtime();
        open(handle, ">>$log_path");
        print handle "[GMT $now] 文件 $watch_file 不存在，发现不存在时的格林威治时间是 $first_time\n";
        close(handle);
    }
    system("sleep $time_wait");
}
