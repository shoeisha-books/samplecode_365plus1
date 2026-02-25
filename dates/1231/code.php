<?php

/**
 * 干支を求める
 */
function getEto(?int $year = null): string
{
    $jikkan = ['癸', '甲', '乙', '丙', '丁', '戊', '己', '庚', '辛', '壬'];
    $juunishi = ['亥', '子', '丑', '寅', '卯', '辰', '巳', '午', '未', '申', '酉', '戌'];

    $year = $year ?? date('Y');

    $thisJikkan = $jikkan[(($year - 3) % 10)];
    $thisJuunishi = $juunishi[(($year - 3) % 12)];

    return $thisJikkan . $thisJuunishi;
}
echo getEto(); // 今年の干支を表示
