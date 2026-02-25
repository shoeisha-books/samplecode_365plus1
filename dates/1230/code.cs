static string ComputePi(int digits){
    const int extra = 10;
    var scale = BigInteger.Pow(10, digits + extra);
    var piScaled = 4 * (4 * ArctanInv(5, scale)
                          - ArctanInv(239, scale));
    var rounded = (piScaled + BigInteger.Pow(10, extra) / 2)
                  / BigInteger.Pow(10, extra);
    var s = rounded.ToString();
    if (s.Length <= digits) s = s.PadLeft(digits + 1, '0');
    var intPart = s.Substring(0, s.Length - digits);
    var frac = s.Substring(s.Length - digits, digits);
    var sb = new StringBuilder(intPart).Append('.');
    for (int i = 0; i < frac.Length; i++){
        sb.Append(frac[i]);
        if ((i + 1) % 50 == 0 && i + 1 < frac.Length){
             sb.Append('\n');
        }
    }
    return sb.ToString();
}
static BigInteger ArctanInv(int q, BigInteger scale){
    BigInteger qBig = q, qpow = qBig, sum = scale / qpow;
    for (int n = 1; ; n++){
        qpow *= qBig * qBig;
        var term = scale / ((2 * n + 1) * qpow);
        if (term.IsZero) break;
        sum += (n % 2 == 1) ? -term : term;
    }
    return sum;
}