#!/bin/bash

export PROJECT_ROOT=`pwd`
export PROJECT_MAVEN_POM=$PROJECT_ROOT/pom
export PROJECT_AWTOOLS=$PROJECT_ROOT/awtools
export PROJECT_BETOFFICE=$PROJECT_ROOT/betoffice
export PROJECT_BETOFFICE_CORE=$PROJECT_BETOFFICE/core
export PROJECT_BETOFFICE_WEB=$PROJECT_BETOFFICE/web
export PROJECT_MISC=$PROJECT_ROOT/misc

echo "Project root is $PROJECT_ROOT"

#
# 1. Create project folders
#
folders=( $PROJECT_AWTOOLS \
 $PROJECT_BETOFFICE \
 $PROJECT_MISC)

for index in $(seq 0 $((${#folders[@]} - 1)))
do
    folder=${folders[index]}
    echo "Build project ${folder}"
    mkdir -p $folder
done

#
# Clone or export all my Maven parent POMs
# 
git clone https://github.com/gluehloch/awtools-maven-pom/ \
 $PROJECT_MAVEN_POM/awtools-maven-pom
svn co https://svn.code.sf.net/p/betoffice/svn/main/trunk/betoffice-pom \
 $PROJECT_MAVEN_POM/betoffice-pom_TRUNK

#
# AWTools COMMONS on Sourceforge
#
svn co https://svn.code.sf.net/p/betoffice/svn/awtools/awtools-basic/trunk \
 $PROJECT_AWTOOLS/awtools-basic_TRUNK
svn co https://svn.code.sf.net/p/betoffice/svn/awtools/awtools-beanutils/trunk \
 $PROJECT_AWTOOLS/awtools-beanutils_TRUNK
svn co https://svn.code.sf.net/p/betoffice/svn/awtools/awtools-config/trunk \
 $PROJECT_AWTOOLS/awtools-config_TRUNK
svn co https://svn.code.sf.net/p/betoffice/svn/awtools/awtools-mail/trunk \
 $PROJECT_AWTOOLS/awtools-mail_TRUNK
svn co https://svn.code.sf.net/p/betoffice/svn/awtools/awtools-lang/trunk \ 
 $PROJECT_AWTOOLS/awtools-lang_TRUNK
svn co https://svn.code.sf.net/p/betoffice/svn/awtools/awtools-xml/trunk \
 $PROJECT_AWTOOLS/awtools-xml_TRUNK

#
# AWTools for Swing
#
svn co https://svn.code.sf.net/p/betoffice/svn/swinger/commons/trunk \
 $PROJECT_AWTOOLS/swinger-commons_TRUNK
svn co https://svn.code.sf.net/p/betoffice/svn/swinger/commands/trunk \
 $PROJECT_AWTOOLS/swinger-commands_TRUNK
svn co https://svn.code.sf.net/p/betoffice/svn/swinger/tree/trunk \
 $PROJECT_AWTOOLS/swinger-tree_TRUNK
svn co https://svn.code.sf.net/p/betoffice/svn/swinger/concurrent/trunk \
 $PROJECT_AWTOOLS/swinger-concurrent_TRUNK

#
# BETOFFICE CORE
#
svn co https://svn.code.sf.net/p/betoffice/svn/main/trunk/betoffice-storage \
 $PROJECT_BETOFFICE_CORE/betoffice-storage_TRUNK
svn co https://svn.code.sf.net/p/betoffice/svn/main/trunk/betoffice-exchange \
 $PROJECT_BETOFFICE_CORE/betoffice-exchange_TRUNK
svn co https://svn.code.sf.net/p/betoffice/svn/main/trunk/betoffice-batch \
 $PROJECT_BETOFFICE_CORE/betoffice-batch_TRUNK
svn co https://svn.code.sf.net/p/betoffice/svn/main/trunk/betoffice-swing \
 $PROJECT_BETOFFICE_CORE/betoffice-swing_TRUNK

#
# BETOFFICE WEB
#
svn co https://svn.code.sf.net/p/betoffice/svn/main/trunk/betoffice-jweb \
 $PROJECT_BETOFFICE_WEB/betoffice-jweb_TRUNK
git clone git@bitbucket.org:andrewinkler/betoffice-js.git \
 $PROJECT_BETOFFICE_WEB/betoffice-js
git clone git@bitbucket.org:andrewinkler/betoffice-home.git \
 $PROJECT_BETOFFICE_WEB/betoffice-home
git clone https://andrewinkler@bitbucket.org/andrewinkler/betoffice-jadmin.git \
 $PROJECT_BETOFFICE_WEB/betoffice-jadmin

#svn co https://svn.code.sf.net/p/betoffice/svn/main/trunk/betoffice-jsweb \
# $PROJECT_BETOFFICE_WEB/betoffice-jsweb_TRUNK

#svn co https://betoffice.svn.sourceforge.net/svnroot/betoffice/gluehloch-homepage/gluehloch-homepage-resource/trunk awtools-homepage-resource_TRUNK
#svn co https://betoffice.svn.sourceforge.net/svnroot/betoffice/gluehloch-homepage/gluehloch-homepage-core/trunk awtools-homepage-core_TRUNK

#svn co https://svn.code.sf.net/p/betoffice/svn/swinger/commons/trunk swinger-commons_TRUNK
#svn co https://svn.code.sf.net/p/betoffice/svn/swinger/commands/trunk swinger-commands_TRUNK
#svn co https://svn.code.sf.net/p/betoffice/svn/swinger/tree/trunk swinger-tree_TRUNK
#svn co https://svn.code.sf.net/p/betoffice/svn/swinger/concurrent/trunk swinger-concurrent_TRUNK
### Deprecated...
#svn co https://betoffice.svn.sourceforge.net/svnroot/betoffice/swinger/view/trunk swinger-view_TRUNK

#svn co https://betoffice.svn.sourceforge.net/svnroot/betoffice/main/trunk/betoffice-hp betoffice-hp_TRUNK
#svn co https://betoffice.svn.sourceforge.net/svnroot/betoffice/gluehloch-mvn-project/trunk/betoffice-parent-pom betoffice-parent-pom_TRUNK

