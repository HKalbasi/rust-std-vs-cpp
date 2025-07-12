to_ns() {
    local v=$1
    case $v in
        *ns) echo "${v%ns} * 1"           | bc -l ;;
        *us) echo "${v%us} * 1000"        | bc -l ;;
        *ms) echo "${v%ms} * 1000000"     | bc -l ;;
        *s)  echo "${v%s} * 1000000000"   | bc -l ;;
    esac
}

to_bytes() {
    local v=$1
    case $v in
        *KB) echo "${v%KB} * 1000"        | bc -l ;;
        *MB) echo "${v%MB} * 1000000"     | bc -l ;;
        *GB)  echo "${v%GB} * 1000000000"   | bc -l ;;    
    esac
}

divide() {
    local ratio=$(echo "scale=4; $1 / $2" | bc -l)
    printf "%.1fx\n" "$ratio" | sed 's/\.0x$/x/'
}    

winner() {
    if (( $(echo "$1 > $2" |bc -l) )); then
        echo "Rust"
    else
        echo "C++"
    fi
}

for_a_single() {
    echo $1
    bash ./compile.sh $1
    poop_rust=$(poop ./bin/rust-$1)
    poop_cpp=$(poop ./bin/cpp-$1)
    wall_time_rust=$(echo "$poop_rust" | awk '/wall_time/ {print $2}')
    wall_time_cpp=$(echo "$poop_cpp" | awk '/wall_time/ {print $2}')
    wall_time_ratio=$(divide $(to_ns $wall_time_cpp) $(to_ns $wall_time_rust))
    
    peak_rss_rust=$(echo "$poop_rust" | awk '/peak_rss/ {print $2}')
    peak_rss_cpp=$(echo "$poop_cpp" | awk '/peak_rss/ {print $2}')
    peak_rss_ratio=$(divide $(to_bytes $peak_rss_cpp) $(to_bytes $peak_rss_rust))
    
    cat <<EOT >> result.md
        <tr>
            <td rowspan=2>$1</td>
            <td>time</td>
            <td>$wall_time_rust</td>
            <td>$wall_time_cpp</td>
            <td>$wall_time_ratio</td>
            <td>$(winner $(to_ns $wall_time_cpp) $(to_ns $wall_time_rust))</td>
        </tr>
        <tr>
            <td>memory</td>
            <td>$peak_rss_rust</td>
            <td>$peak_rss_cpp</td>
            <td>$peak_rss_ratio</td>
            <td>$(winner $(to_bytes $peak_rss_cpp) $(to_bytes $peak_rss_rust))</td>
        </tr>
EOT
}

cat <<EOT > result.md
<table>
    <thead>
        <tr>
            <th>Benchmark name</th>
            <th>Measured property</th>
            <th>Rust</th>
            <th>C++</th>
            <th>Ratio</th>
            <th>Winner</th>
        </tr>
    </thead>
EOT

for i in $(ls benches/*.rs)
do
    for_a_single $(basename $i .rs)
done

cat <<EOT >> result.md
    </tbody>
</table>
EOT
