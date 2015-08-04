#!/bin/bash
DATE=`date`
TARGET_DIR=$PWD/.texlive
PROFILE=$PWD/.texlive.profile
PROFILE_OLD=$TARGET_DIR/.texlive.profile

cat > $PROFILE <<EOF
# texlive.profile generated on $DATE
selected_scheme scheme-custom
TEXDIR $TARGET_DIR
TEXMFCONFIG $TEXMFSYSCONFIG
TEXMFHOME $TEXMFLOCAL
TEXMFLOCAL $TARGET_DIR/texmf-local
TEXMFSYSCONFIG $TARGET_DIR/texmf-config
TEXMFSYSVAR $TARGET_DIR/texmf-var
TEXMFVAR $TEXMFSYSVAR
binary_x86_64-darwin 0
binary_x86_64-linux 1
collection-basic 1
collection-bibtexextra 1
collection-binextra 1
collection-context 1
collection-fontsextra 1
collection-fontsrecommended 1
collection-fontutils 1
collection-formatsextra 1
collection-games 1
collection-genericextra 1
collection-genericrecommended 1
collection-htmlxml 1
collection-humanities 1
collection-langenglish 1
collection-langeuropean 1
collection-latex 1
collection-latexextra 1
collection-latexrecommended 1
collection-luatex 1
collection-mathextra 1
collection-metapost 1
collection-music 1
collection-omega 1
collection-pictures 1
collection-plainextra 1
collection-pstricks 1
collection-publishers 1
collection-science 1
collection-texworks 1
collection-xetex 1
option_adjustrepo 1
option_autobackup 0
option_desktop_integration 0
option_doc 0
option_file_assocs 0
option_fmt 1
option_letter 0
option_menu_integration 0
option_path 0
option_post_code 1
option_src 0
option_sys_bin /usr/local/bin
option_sys_info /usr/local/share/info
option_sys_man /usr/local/share/man
option_w32_multi_user 0
option_write18_restricted 1
portable 1
EOF

if [ ! $(diff $PROFILE $PROFILE_OLD) ]
then
  rm -rf $TARGET_DIR
  curl -LO http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar xzvf install-tl-unx.tar.gz
  cd install*
  ./install-tl -profile $PROFILE
  cp $PROFILE $PROFILE_OLD
  cd ..
fi

export PATH=$TARGET_DIR/bin/x86_64-linux:$PATH
export TEXDIR=$TARGET_DIR
export TEXMFLOCAL=$TARGET_DIR/texmf-local
export TEXMFSYSCONFIG=$TARGET_DIR/texmf-config
export TEXMFSYSVAR=$TARGET_DIR/texmf-var
