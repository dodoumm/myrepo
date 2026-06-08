BEGIN {
    printf "%-4s %-4s %-3s %-3s %-3s %-4s %-4s\n",
           "학번", "이름", "국어", "영어", "수학", "총점", "평균"
}

NR > 1 {
    total = $3 + $4 + $5
    avg = total / 3

    printf "%-5s %-4s %-4d %-4d %-5d %-6d %.1f\n",
           $1, $2, $3, $4, $5, total, avg

    kor_sum += $3
    eng_sum += $4
    math_sum += $5
    cnt++
}

END {
    printf "\n과목평균      %-4.1f %-4.1f %-4.1f\n",
           kor_sum/cnt,
           eng_sum/cnt,
           math_sum/cnt
}
