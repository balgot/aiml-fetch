#!/bin/bash


log() {
	echo "#"
	echo "# Downloading $@"
	echo "#"
}


#
#
log AIML 2 bots from github/AIMLang/aiml_bots
#
#
git clone https://github.com/AIMLang/aiml-bots.git tmp > /dev/null
mv tmp/bots ./aimlang-bots
rm -rf tmp


#
#
log github/akash-1618/Nutritionist-Chatbot
#
#
echo "Downloading... nutriotionist bot"
git clone https://github.com/akash-1618/Nutritionist-Chatbot.git tmp > /dev/null
mv tmp/_my_aiml ./nutritionist-bot
mv tmp/alice ./alice-nutritionist-bot
mv tmp/standard ./std-nutritionist
rm -rf tmp


#
#
log pandorabots/Free-AIML
#
#
git clone pandorabots/Free-AIML free-aiml-pandorabots  > /dev/null


#
#
log oob tags
#
#
git clone https://github.com/pandorabots/aiml-en-us-pandorabots-callmom.git oob-tags > /dev/null


#
#
log substitutions
#
#
git clone https://github.com/pandorabots/substitutions.git tmp > /dev/null
mv tmp/lib ./substitutions-pandorabots
rm -rf tmp


#
#
log ANT
#
#
mkdir misc
curl https://escholarship.org/content/qt01b6x489/supp/ANTswers_Program_Files_b_profile.aiml > misc/ANT.aimli


#
#
log files from bot libre
#
#
python -m pip install -r requirements.txt
python download-botlibre.py


#
#
log techmaru sets and map
#
#
python download-techmaru-sets.py

#
#
log Alice I
#
# git clone https://github.com/drwallace/aiml-en-us-foundation-alice.git alice-bot-v1
curl https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/aiml-en-us-foundation-alice/source-archive.zip --output archive.zip
jar xf archive.zip
mv aiml-en-us-foundation-alice alice-bot-v1
rm archive.zip
# also here: https://code.google.com/archive/p/aiml-en-us-foundation-alice/downloads


#
#
log Alice II
#
#
curl https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/aiml-en-us-foundation-alice2/source-archive.zip --output archive.zip
jar xf archive.zip
mv aiml-en-us-foundation-alice2 alice-bot-v2
rm archive.zip


#
#
log Emmie
#
#
git clone https://github.com/drwallace/aiml-en-us-pandorabots-infotabby.git tmp > /dev/null
mv tmp/Emmie ./emmie-bot
rm -rf tmp

#
log wikidot - different languages
#
python download-wikidot.py

#
log weixin-robot chatbot
#
git clone https://github.com/w940853815/weixin-robot.git tmp > /dev/null
mv ./tmp/app/aiml_set ./weixin-robot
rm -rf tmp

#
log ansr8r bot
#
git clone https://github.com/russellhaering/ansr8r.git tmp > /dev/null
mv ./tmp/standard ./std-ansr8r
rm -rf tmp

#
log aiml utils: bool, +, -
#
git clone https://github.com/pandorabots/aiml-utilities.git tmp > /dev/null
mv tmp/lib ./aiml-utils-pandorabots
rm -rf tmp

#
log savagemaster-bot
#
git clone https://github.com/AlexDev404/savagemaster-aiml.git  > /dev/null

#
log program K
#
git clone https://github.com/logicmoo/programk.git tmp > /dev/null
mv ./tmp/aiml ./programk
rm -rf tmp

#
log mathbot
#
git clone https://github.com/attogram/mathbot.git > /dev/null

#
log elsa bot
#
git clone https://github.com/ApoorvaCh/Elsa.git tmp > /dev/null
mv tmp/app/src/main/assets/Vaccines ./elsa-bot
rm -rf tmp

#
log "naruto bot (french)"
#
git clone https://github.com/tsotne95/Naruto_Bot.git tmp > /dev/null
mv tmp/bots/naruto .
rm -rf tmp

#
log "aiml sets (mitsuku, alice ..)"
#
git clone https://github.com/hosford42/AIML_Sets.git tmp > /dev/null
mv tmp/aiml_sets .
rm -rf tmp

#
log "aiml3 (chinese)"
#
git clone https://github.com/Decalogue/aiml3.git tmp > /dev/null
mv tmp/chinese ./aiml3-chinese
rm -rf tmp

#
log amelia bot
#
git clone https://github.com/kaustubh03/amelia_2.0.git tmp > /dev/null
mv tmp/*.aiml ./amelia-bot/
rm -rf tmp

#
log BombExpert
#
git clone https://github.com/AndrioCelos/BombExpert.git tmp > /dev/null
mv ./tmp/Bot ./bombexpert-bot
rm -rf tmp

#
log sandysanthosh/chatbot
#
git clone https://github.com/sandysanthosh/Chatbot.git tmp > /dev/null
mv tmp/src/main/resources/bots/ ./sandysanthosh-chatbot
rm -rf tmp

#
log student-puma/chatbots
#
git clone https://github.com/Student-Puma/Chatbots.git tmp > /dev/null
mv ./tmp/app/src/resources/bots/proyecto ./proyecto-chatbot-spa
rm -rf tmp

#
log bot henry
#
git clone https://github.com/JCab09/ROS-chatbot_inMoov.git tmp > /dev/null
mv tmp/bot_Henry/storage/categories/ ./henry-bot
rm -rf tmp

#
log claudia bot
#
git clone https://github.com/kirkins/Claudia-AIML-Bot-2.git tmp > /dev/null
mv ./tmp/responses ./claudia-bot
rm -rf tmp

#
log portuguese bot
# 
git clone https://github.com/roltel/aiml-pt-pt-futuragora-venus.git tmp > /dev/null
mv tmp/branches/*/*.aiml ./futuragora-portuguese/
mv tmp/aiml/*.aiml ./futuragora-portuguese/
rm -rf tmp

#
log healthbot
#
git clone https://github.com/msiddhu/healthAssistBot.git tmp > /dev/null
mv tmp/app/src/main/assets/msiddhu/aiml/ ./health-assist-bot
rm -rf tmp

#
log "concierge-network -- pandorabots"
#
git clone https://github.com/pandorabots/concierge-network.git > /dev/null

#
log square-bear
#
python download-squarebear.py
