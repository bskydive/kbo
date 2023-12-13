#!/bin.bsdh

# для создания файла со словами исключениями проверки орфографии

npm run articles-spell  2>./spell.summary.log  | tail -n +4 | grep -v '^[[:blank:]]*$' > ./spell.log

cat ./spell.log | grep -i word | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > ./spell.words.log

# cat ./spell.words.log >> ./cspell-dict-exclude.txt
