# fetch and download bots from github
# then transform them from programy format
# to ALICE format:
#   bot_name
#       |- aiml/
#       |- aimlif/
#       |- substitutions/ (normal, denormal, person, person2, gender)
#       |- properties.txt
#       |- sets/
#       |- maps/

download() {
    git clone $2 tmp > /dev/null
    mkdir $1

    mv tmp/storage/maps $1
    mv tmp/storage/sets $1
    mv tmp/storage/properties/properties.txt $1
    mkdir $1/substitutions
    mv tmp/storage/lookups/*.txt $1/substitutions
    mkdir $1/aiml
    find tmp/storage/categories -name "*.aiml" -exec mv {} $1/aiml \;
    mkdir $1/aimlif

    rm -rf tmp
}


download y-bot https://github.com/keiffster/y-bot.git
download y-rossie https://github.com/keiffster/rosie-y.git
