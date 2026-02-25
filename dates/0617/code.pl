% 事実                       % お市の方
child(chacha, oichi).      % +-娘: 茶々
child(tsurumatsu, chacha). % | +-子: 鶴松
child(hideyori, chacha).   % | +-子: 秀頼
child(hatsu, oichi).       % +-娘: 初
child(goh, oichi).         % +-娘: 江
child(iemitsu, goh).       %   +-子: 家光
child(tadanaga, goh).      %   +-子: 忠長

% 規則
mother(X, Y) :- child(Y, X). % YがXの子ならばXはYの母である
grandmother(X, Y) :- mother(X, Z), mother(Z, Y). % 母の母は祖母である
son(X, Y) :- grandmother(Y, X). % YがXの祖母ならばXはYの孫である

% ?- grandmother(X, iemitsu). % 家光の祖母は誰？
% X = oichi ;                 % お市の方
% false.

% ?- son(X, oichi).           % お市の方の孫は誰？
% X = tsurumatsu ;            % 鶴松
% X = hideyori ;              % 秀頼
% X = iemitsu ;               % 家光
% X = tadanaga.               % 忠長

% リストの長さを求める
len([], 0).                   % 空リストの長さは0
len([_Head|Tail], L) :-       % リストの長さは
    len(Tail, L1),            % 先頭要素を取り去った長さに
    L is L1 + 1.              % 1を加えたもの

% ?- len([a, b, c, d, e], X).
% X = 5.
