class Sessalet: 
    """ 洗浄便座Sessalet """
    def __init__(self, states=None):
        self.states = set(states or {"起立", "待機中"})
    def __eq__(self, other): return self.states == (
        other if isinstance(other, set) else None)
    def _change(self, remove, add):
        self.states.discard(remove), self.states.add(add)
    def do(self, event):
        actions = {
            "座る": lambda: self._change("起立", "着座"),
            "立つ": lambda: (self._change("着座", "起立"),
                             self._change("おしり洗浄中", "待機中")),
            "おしりボタン": lambda: (self._change("待機中", "おしり洗浄中")
                                 if "着座" in self.states else None),
            "停止": lambda: self._change("おしり洗浄中", "待機中")
        }
        if event in actions: actions[event]()
        return self
# 初期状態
assert Sessalet() == {'起立', '待機中'}
# 座らないとおしりが洗えない
assert Sessalet().do("おしりボタン") == {'起立', '待機中'}
# 座っていればおしりが洗える
assert Sessalet().do("座る").do("おしりボタン") == {'着座', 'おしり洗浄中'}
# おしり洗浄停止
assert Sessalet().do("座る").do("おしりボタン").do("停止") == {'着座', '待機中'}
# おしりを洗っているときに立てば、自動的に洗浄が止まる
assert Sessalet().do("座る").do("おしりボタン").do("立つ") == {'起立', '待機中'}

