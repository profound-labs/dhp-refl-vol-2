#!/bin/bash

# get the numbers

#grep -E '\\begin[{]dhpVerse' |\
#sed 's/^.*[}][{]\([0-9-]\+\)[}]$/\1/' |\
#sort -h | sed -e 's/.*/v. & \& . \& \\pageref{dhp-&}\\\\/; s/\(dhp-[0-9]\+\)-[0-9]\+/\1/' > index

cat versepages.tex |\
sed '/begin[{]dhpVerse/{
    N;N;
    s/^.*[}][{]\([0-9-]\+\)[}].*\n\\label[{]\(dhp-[0-9]\+\)[}].*\n\([^\\]\+\) *\\* *$/\1 \& \3 \& \\pageref{\2}\\\\/;
    s/^\([0-9]\+-\)[0-9]*\([0-9] \)/\1\2/;
}' |\
grep -E '^[0-9-]+ &' | sort -h |\
sed 's/^/V. /' > index

