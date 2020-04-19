OUTPUT=${1:-movie}
DIR=${2:-data}

# Select conversion binary
# The one for moffatt vortices scales the numbers a bit
CONVERT=vel2heat
if [ $OUTPUT = "moffatt" ]; then
    CONVERT=vel2heat_scale
fi

# Make gnuplot-friendly matrices
for f in `ls ${DIR}/*.vel`; do
    echo "./${CONVERT} $f"
    ./${CONVERT} $f
done

# Plot them
for f in `ls ${DIR}/*.mat`; do
    echo "./generate_heatmap.pl $f"
    ./generate_heatmap.pl $f
    sleep 0.2
done

# Make a movie
${FFMPEG} -i ${DIR}/%4d.png ${FFMPEG_FLAGS} ${OUTPUT}.mp4
