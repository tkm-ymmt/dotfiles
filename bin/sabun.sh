#!/bin/sh

git show --name-status \
22ccdf6b87dde8509e39b0af6611ddd5065f9eb6  \
0b31d20bfdd78bfb88842e39a75f7a2e7b47b8aa  \
e0cabad84f04660e973588e1844654d5ec270f9a  \
eaed62aee9227105a48e32ce7d9a1dd11e7c217c  \
b07735d6c3f9575c9d21846b54e91f87350a564d  \
9b2f06f57bdb89bb56bcfb7f795f46eafd100b17  \
9202959100ca677eb6a535a7c5e4cbf9b6bbb598  \
7e01e3a9a028ca286c264d5b105fe171c62e8741  \
0a9d7e1cb4b6c2051e4516f7b865765e95158be5  \
bb42e9bae03882f3b373793e2065ff9daa00e7f5  \
7165a9f0e6acad2b589d821bebef6eb202bb293d  \
fc57ae18a1d454c39277abd97a718abd464e3afd  \
8c0772a039d52b18d75aa4ae03520956c4923d7f  \
abb31d481fda63cbf56a425dac8a96f85b28c595  \
0e42ce4253ef9c35b1e429908992d88676e305a6  \
7ee4dfa46f3874e5ab3aabcb53748ae7d074c57e  \
95435f6ba29e0659a86f528b007eee8313415410  \
e3a865a8b133779f763a73df6f48dcec1e159968  \
15feff7ce9e3e0129548c9ac42d625d8f73402fd  \
d453e1d2baaa681a25114dd65c2558d4f290d643  \
c141f5563606746f3fdeb2837e493595de854f46  \
fb3ecd35ef7b6073ec49e60fe89b36c62ff54191  \
0e32356c3d03eabe5fff964e663161924e2e4509  \
84d7606eef63c54255c81acbcb678f09bdff51ef  \
f28fedd1532122202070f0f36ba4d77100c92c65  \
e741b98ebc81bcf965bba5d3980346a8afab9324  \
0c48f77c7552f26391ad2be3f240ff9d72f437d0  \
e4b463c4d31f71b7e11ea83ac28779a17d0efd8b  \
b6c6b1a2274cd770075fa5b9d62e798055f0f276  \
| awk '($1 == "M" || $1 == "A") { print $2 }' | sort | uniq
