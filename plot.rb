df=open("data.txt","w")
-5.step(5,0.5) {|count|
  df.puts "#{(count+5)*0.1},#{180.0/(1.0+Math.exp(-(count-0.5)))}"
}
df.close

fname="hoge.gp"
fp=open(fname,"w")
fp.puts 'reset'
fp.puts 'set term svg; set output "sigdata.svg"'
fp.puts 'set datafile separator " ,"; set key font "Arial,20";set title font "Arial,60";set title "シグモイド関数のサーボモータのグラフ"'
#fp.puts 'set object rectangle from screen 1,1 to screen 0,0.875 behind fc rgbcolor "yellow";'
fp.puts 'set tics font"Arial,20"'
fp.puts 'set xlabel font"Arial,20";set xlabel "時間[0-1](s)";set ylabel font"Arial,20";set ylabel "角度[deg]"'
fp.puts 'set xtics 0,0.05,1; set term svg enhanced mouse size 1500,1000;'
fp.puts 'plot"'+"data.txt"+'" using 1:2 w lp lw 3 lt 15 pt 7 notitle'
fp.close
p `gnuplot hoge.gp`

df=open("data.txt","w")
0.step(1,0.05) {|count|
  df.puts "#{count},#{(Math.cos((count+1) *Math::PI)+1)*90}"
}
df.close

fname="hoge.gp"
fp=open(fname,"w")
fp.puts 'reset'
fp.puts 'set term svg; set output "cosdata.svg"'
fp.puts 'set datafile separator ","; set key font "Arial,20";set title font "Arial,60";set title "cosのサーボモータのグラフ"'
#fp.puts 'set object rectangle from screen 1,1 to screen 0,0.875 behind fc rgbcolor "yellow";'
fp.puts 'set tics font"Arial,20"'
fp.puts 'set xlabel font"Arial,20";set xlabel "時間[0-1](s)";set ylabel font"Arial,20";set ylabel "角度[deg]"'
fp.puts 'set xtics 0,0.05,1 ; set ytics 0,20,180; set term svg enhanced mouse size 1500,1000;'
fp.puts 'plot"'+"data.txt"+'" using 1:2  w lp lw 3 lt 15 pt 7 notitle '
fp.close
p `gnuplot hoge.gp`
