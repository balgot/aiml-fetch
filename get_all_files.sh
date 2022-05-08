#!/bin/bash


set -e


log() {
	echo "#"
	echo "# Downloading $@"
	echo "#"
}


# initialisation
python -m pip install -r requirements.txt



################################################################################
#           A I M L        F o u n d a t i o n    F i l e s
################################################################################


#
#
log "AIML Encyklopedia"
#
#
curl https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/aiml-en-uk-plafferty-encyclopedia/source-archive.zip --output archive.zip
jar xf archive.zip
mv aiml-en-uk-plafferty-encyclopedia aiml-encyclopedia
rm -rf aiml-encyclopedia/.hg
rm archive.zip


#
#
log "AIML Professor"
#
#
curl https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/aiml-en-uk-plafferty-professor/source-archive.zip --output archive.zip
jar xf archive.zip
mv aiml-en-uk-plafferty-professor aiml-professor
rm -rf aiml-professor/.hg
rm archive.zip


#
#
log "Alice I"
#
#
curl https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/aiml-en-us-foundation-alice/source-archive.zip --output archive.zip
jar xf archive.zip
mv aiml-en-us-foundation-alice alice1
rm -rf alice-bot-1/.hg
rm archive.zip
# also here: https://code.google.com/archive/p/aiml-en-us-foundation-alice/downloads
# git clone https://github.com/drwallace/aiml-en-us-foundation-alice.git alice-bot-v1


#
#
log "Alice II"
#
#
curl https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/aiml-en-us-foundation-alice2/source-archive.zip --output archive.zip
jar xf archive.zip
mv aiml-en-us-foundation-alice2 alice2
rm -rf alice2/.hg
rm archive.zip



################################################################################
#                     P a n d o r a   B o t s
################################################################################

#
#
log "oob tags"
#
#
git clone https://github.com/pandorabots/aiml-en-us-pandorabots-callmom.git oob-tags > /dev/null
rm -rf oob-tags/.git


#
#
log "pandorabots/Free-AIML"
#
#
git clone https://github.com/pandorabots/Free-AIML.git pandora-free-aiml  > /dev/null
rm -rf pandora-free-aiml/.git


#
#
log "pandorabots-substitutions"
#
#
git clone https://github.com/pandorabots/substitutions.git tmp > /dev/null
mv tmp/lib ./substitutions-pandorabots
rm -rf tmp


#
#
log "concierge-network pandorabots"
#
#
git clone https://github.com/pandorabots/concierge-network.git tmp
for name in personal  drakebot musiccat
do
	mv tmp/$name concierge-$name
done
rm -rf tmp


#
#
log "aiml utils: bool, +, -"
#
#
git clone https://github.com/pandorabots/aiml-utilities.git tmp > /dev/null
mv tmp/lib ./aiml-utils-pandorabots
rm -rf tmp



################################################################################
#                         G i t H u b
################################################################################

#
#
log "AIML 2 bots from github/AIMLang/aiml_bots"
#
#
git clone https://github.com/AIMLang/aiml-bots.git tmp > /dev/null
mv tmp/bots/jokebot ./aimlang-jokebot
mv tmp/bots/russian ./aimlang-russian
mv tmp/bots/wndef ./aimlang-wndef
mv tmp/bots/currentevents ./aimlang-currentevents
rm -rf tmp


#
#
log "github/akash-1618/Nutritionist-Chatbot"
#
#
git clone https://github.com/akash-1618/Nutritionist-Chatbot.git tmp > /dev/null
mv tmp/_my_aiml ./nutritionist-bot
rm -rf tmp



#
#
log "Emmie"
#
#
git clone https://github.com/drwallace/aiml-en-us-pandorabots-infotabby.git tmp > /dev/null
mv tmp/Emmie ./emmie-bot
rm -rf emmie-bot/*.zip
rm -rf tmp


#
#
log "weixin-robot chatbot"
#
#
git clone https://github.com/w940853815/weixin-robot.git tmp > /dev/null
mv ./tmp/app/aiml_set ./weixin-robot
rm -rf tmp


#
#
log "savagemaster-bot"
#
#
git clone https://github.com/AlexDev404/savagemaster-aiml.git  > /dev/null
rm -rf savagemaster-aiml/.git


#
#
log "program K"
#
#
git clone https://github.com/logicmoo/programk.git tmp > /dev/null
mv ./tmp/aiml ./programk
rm -rf tmp


#
#
log "mathbot"
#
#
git clone https://github.com/attogram/mathbot.git > /dev/null
rm -rf mathbot/.git


#
#
log "elsa bot"
#
#
git clone https://github.com/ApoorvaCh/Elsa.git tmp > /dev/null
mv tmp/app/src/main/assets/Vaccines ./elsa-bot
rm -rf tmp


#
#
log "naruto bot (french)"
#
#
git clone https://github.com/tsotne95/Naruto_Bot.git tmp > /dev/null
mv tmp/bots/naruto .
rm -rf tmp


#
#
log "aiml sets (mitsuku)"
#
#
git clone https://github.com/hosford42/AIML_Sets.git tmp > /dev/null
mv tmp/aiml_sets/mitsuku ./aiml-sets-mitsuku
rm -rf tmp


#
#
log "aiml3 (chinese)"
#
#
git clone https://github.com/Decalogue/aiml3.git tmp > /dev/null
mv tmp/chinese ./aiml3-chinese
rm -rf tmp


#
#
log "amelia bot"
#
#
git clone https://github.com/kaustubh03/amelia_2.0.git tmp > /dev/null
mkdir amelia-bot
mv tmp/*.aiml ./amelia-bot
rm -rf tmp


#
#
log "BombExpert"
#
#
git clone https://github.com/AndrioCelos/BombExpert.git tmp > /dev/null
mv ./tmp/Bot ./bombexpert-bot
rm -rf tmp


#
#
log "sandysanthosh/chatbot"
#
#
git clone https://github.com/sandysanthosh/Chatbot.git tmp > /dev/null
mv tmp/src/main/resources/bots/ ./sandysanthosh-chatbot
rm -rf tmp


#
#
log "student-puma/chatbots"
#
#
git clone https://github.com/Student-Puma/Chatbots.git tmp > /dev/null
mv ./tmp/app/src/resources/bots/proyecto ./proyecto-chatbot-spa
rm -rf tmp


#
#
log "bot henry"
#
#
git clone https://github.com/JCab09/ROS-chatbot_inMoov.git tmp > /dev/null
mv tmp/bot_Henry/storage/categories/ ./henry-bot
rm -rf tmp


#
#
log "claudia bot"
#
#
git clone https://github.com/kirkins/Claudia-AIML-Bot-2.git tmp > /dev/null
mv ./tmp/responses ./claudia-bot
rm -rf tmp


#
#
log "portuguese bot"
#
#
git clone https://github.com/roltel/aiml-pt-pt-futuragora-venus.git tmp > /dev/null
mkdir futuragora-portuguese
mv tmp/branches/*/*.aiml ./futuragora-portuguese/
mv tmp/aiml/*.aiml ./futuragora-portuguese/
rm -rf tmp


#
#
log "healthbot"
#
#
git clone https://github.com/msiddhu/healthAssistBot.git tmp > /dev/null
mv tmp/app/src/main/assets/msiddhu/aiml/ ./health-assist-bot
rm -rf tmp


################################################################################
#                           M i s c
################################################################################


#
#
log "ANT"
#
#
mkdir ant
curl https://escholarship.org/content/qt01b6x489/supp/ANTswers_Program_Files_b_profile.aiml > ant/ANT.aimli


#
#
log "files from bot libre"
#
#
python helpers/download-botlibre.py


#
#
log "techmaru sets and map"
#
#
python helpers/download-techmaru-sets.py


#
#
log "wikidot - different languages"
#
#
python helpers/download-wikidot.py


#
#
log "square-bear"
#
#
python helpers/download-squarebear.py


#
#
log "program-y bots"
#
#
bash helpers/get_programy_bots.sh
