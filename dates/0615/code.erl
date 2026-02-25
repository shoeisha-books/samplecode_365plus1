-module(range_sum).

-export([range_sum/2]).

% StartからEndまでの数値を加算する関数
range_sum(Start, End) ->
    range_sum_iter(Start, End, 0).

% CurrentがEndになるまでSumに足す関数
range_sum_iter(Current, End, Sum) ->
    NewSum = Sum + Current,                           % 新しい合計
    case Current =:= End of                           % もしCurrentとEndが
        false ->                                      % 等しくないなら
            range_sum_iter(Current + 1, End, NewSum); %   1増やして再帰する
        true -> NewSum                                % 等しければ合計を返す
    end.

% 実行結果:
% range_sum:range_sum(1, 10)   => 55
% range_sum:range_sum(1, 100)  => 5050
% range_sum:range_sum(50, 100) => 3825
% range_sum:range_sum(50, 55)  => 315
