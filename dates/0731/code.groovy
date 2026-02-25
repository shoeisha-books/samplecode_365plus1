class WordCounterSpec extends Specification {
    
    @Unroll
    def "テキストから上位3つの単語を取得: '#text'"() {
        given: "単語カウンターを作成し、テキストをカウント"
        def counter = new WordCounter()
        counter.count(text)
        
        when: "上位3つの単語を取得"
        def top3 = counter.getTop(3)
        
        then: "期待する結果と一致する"
        top3 == expected
        
        where:
        text | expected
        "the cat sat on the mat" | [the: 2, cat: 1, sat: 1]
        "I love Java and I love coding" | [I: 2, love: 2, Java: 1]
        "hello world" | [hello: 1, world: 1]
        "test test test" | [test: 3]
    }
}