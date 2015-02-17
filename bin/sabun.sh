#!/bin/sh

git show --name-status \
57c75c1e56614ce523b6503fe7724eb9a5ed868e \
a44a76f97da653b5d5e3ec5f1649d548907446bd \
fafbf0b7a4154d91e5c7e40e70694e2b747510e9 \
7cd17423101f2ab63b3e03070da0709937e2f2ef \
567ec591a84328bce71e636fdb68238f2b50d8c7 \
b7530812496fcff1fe74b9331d4e366e2f02a77c \
d609aeea6d8db4980874223ce7c8c50d42a7e1a4 \
f371c0502f5db6b7ffc4b1225f81ce33fa275d50 \
70b65a2a80d2e3bba6f98ee21b23e4681ea2e837 \
9b4c9c74dc9d718220d3484bad76e5a972e37705 \
2b215fe7dc2136ff8b316e56c8128bfff02a9996 \
225e319d1810ae5f5d12a0b6ec9f2c0346ec00f8 \
cbd9bb5db5ffd51f35e453d1c2f8769e1d48372b \
717c65388afe36c0925db80f5e57a4e50dd4b5c4 \
a76812fb27712ac46d9ac1d487667db9d652abf9 \
80ecfb83bfdbb59066ad56ae91206db39ef39eab \
d8bb5ad52c78dc5b10ef2676376d94f07fae49c2 \
e00cf8ca19b62cceea1499893c3620dc3199ae2d \
36ccaef3fa3646a1c6db8f1cea92390cd2b5e5f8 \
2b91891a5d85dc35d869f333dd949f6a73c4541e \
1b88b5329b9457e95a05b8e4fc06d5781c660aa0 \
703803a5dfc4f9d587be8792caa990b4a3551f46 \
7775ce98516f0791f026b243303bdc831397400f \
458c19253b83d9ece12bf9f32c21d9c212ba991e \
50d8031b4c2b9a991841f3c184a33953dfa692f8 \
befa6e527b23cc9b580f266796c061ef02a72885 \
230344f07c8515fab3f12b6a5c94e2e9c3f605fc \
ce745f13e862932fe751c7bb55070a1ca8827b0a \
d8bb5ad52c78dc5b10ef2676376d94f07fae49c2 \
| awk '($1 == "M" || $1 == "A") { print $2 }' | sort | uniq
