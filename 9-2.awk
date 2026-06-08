BEGIN {
    OFS="\t"
}

NR == 1 {
    print $0, "총점", "평균"

    subjCnt = NF - 2

    for(i=3; i<=NF; i++)
        subject[i] = $i

    next
}

{
    total = 0

    for(i=3; i<=NF; i++) {
        total += $i
        sum[i] += $i
    }

    avg = total / (NF - 2)

    printf "%s\t%s", $1, $2

    for(i=3; i<=NF; i++)
        printf "\t%d", $i

    printf "\t%d\t%.1f\n", total, avg

    studentCnt++
}

END {
    printf "\n과목평균"

    for(i=3; i<=subjCnt+2; i++)
        printf "\t%.1f", sum[i]/studentCnt

    printf "\n"
}
