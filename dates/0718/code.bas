CLS
PRINT "************************"
PRINT "*   YES/NOゲームへようこそ   *"
PRINT "************************"
PRINT
PRINT "質問に答えてください。"
PRINT

RANDOMIZE TIMER

DIM Q$(5)
Q$(1) = "コーヒーは好きですか？"
Q$(2) = "猫を飼っていますか？"
Q$(3) = "まだ昼ごはんを食べていませんか？"
Q$(4) = "今眠いですか？"
Q$(5) = "旅行に行きたいですか？"

Q = INT(RND * 5) + 1

PRINT Q$(Q)
INPUT "はい(Y) いいえ(N) > ", A$

IF UCASE$(A$) = "Y" THEN
    PRINT "YESを選びました！"
ELSEIF UCASE$(A$) = "N" THEN
    PRINT "NOを選びました！"
ELSE
    PRINT "Y または N を入力してください。"
END IF

PRINT "ありがとうございました。"
END
