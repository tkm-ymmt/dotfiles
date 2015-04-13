#!/bin/sh

git show --name-status \
 a8c994be9806cdfbeefb227403dd193cf64df921 \
 609691b012ba45ea88232735eca38cb463c04807 \
 719fc38b4e2ac7081517d3a4e63511f0c5a037bd \
 29991579ac88692d75c8a9df30d4a4f912e74d02 \
| awk '($1 == "M" || $1 == "A") { print $2 }' | sort | uniq
