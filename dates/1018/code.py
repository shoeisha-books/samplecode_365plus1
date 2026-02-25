# Pythonで1行プログラムを目指して、最初はこう書いてみたが・・・
# import time,sys;[sys.stdout.write('\r' + ' ' * i + '人') or sys.stdout.flush() or time.sleep(0.3) for i in range(30)]
# time.sleep()が機能していない。どうも、リスト内包表記の中で、time.sleep()の処理がスキップされるらしい(･o･;) ﾏｼﾞ…
# リスト内包表記の処理では、どうやら、リスト作成が優先されている様子。そうだよね、リスト作るのに時間処理要らないよね

import time, sys; i=0; exec("while i<30: sys.stdout.write('\\r' + ' '*i + '人→'); sys.stdout.flush(); time.sleep(0.3); i+=1")
# 1行で書こうと思うと、ついついリスト内包表記に脳が行きがち。ずるいが、セミコロン区切りで、何とか解決 (; ^ ｰ^)
# 最終的に、「→」をつけて、疾走感を出してみました～ Ψ(｀∀´)Ψ
# プログラミングには、こういうことがあり、原因を探求するのが楽しい 楽ｼ⌒Ｙ⌒ヾ