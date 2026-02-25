-- Ada 並行処理サンプル：Ping-Pong
-- 2つのタスクが protected オブジェクトを介して次のように交互に実行される。
--     PING >> o
--     o << pong
-- entry ... when のガードで「PING」「pong」が必ず交互に出力される。
with Ada.Text_IO; use Ada.Text_IO;
procedure Ping_Pong is
    -- 保護オブジェクト：共有資源を安全に制御
    protected Token is
    entry Ping;  -- PING出力用
    entry Pong;  -- pong出力用
    private Turn : Boolean := True;  -- True=PINGの番
    end Token;
    protected body Token is
    entry Ping when     Turn is begin Put_Line("PING >> o"); Turn := False; end; -- 次はpong
    entry Pong when not Turn is begin Put_Line("o << pong"); Turn := True;  end; -- 次はPING
    end Token;
    -- 並行に動く2つのタスク
    Rallies : constant Positive := 6;  -- 繰り返し回数
    task P1; task P2;
    task body P1 is begin for I in 1 .. Rallies loop Token.Ping; end loop; end P1; -- PINGをN回
    task body P2 is begin for I in 1 .. Rallies loop Token.Pong; end loop; end P2; -- pongをN回
begin
    null;  -- メインは空。タスクが自動実行される
end Ping_Pong;
