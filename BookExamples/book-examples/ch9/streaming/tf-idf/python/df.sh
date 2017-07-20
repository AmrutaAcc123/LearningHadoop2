/usr/bin/hadoop  jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar \
-D mapreduce.map.tasks=1 \
-D stream.num.map.output.key.fields=3 \
-D mapreduce.output.key.comparator.class=org.apache.hadoop.mapreduce.lib.KeyFieldBasedComparator \
-D mapreduce.text.key.comparator.options="-k1" \
-input /tmp/tf-out.tsv/part-00000 \
-output /tmp/df-out.tsv \
-file map-df.py \
-mapper "python map-df.py" \
-file reduce-df.py \
-reducer "python reduce-df.py" 