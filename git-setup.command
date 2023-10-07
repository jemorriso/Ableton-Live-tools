#! /bin/zsh -f
# shebang '-f' to avoid zshrc

# cd to current script directory
cd $0:h

hook=.git/hooks/pre-commit
gzip='zcat -f'

# unzip on add
git config filter.gzip.smudge $gzip
# unzip on pull
git config filter.gzip.clean $gzip
# when git needs to diff, unzip
git config diff.gzip.command $gzip

# use gitattributes instead  to specify which files to zip
# applies to all files (?)
# git config filter.gzip.required true


#git config include.path ../.gitconfig #mv -f {,.git/}config

mkdir -p $hook:h #&& ln -s {../../.,$_/}$hook:t #mv {,$_/}$hook:t

# cat hook from main branch into $hook and make executable
git show main:$hook:t >> $hook && chmod +x $hook
#git config core.hooksPath .

# install git-lfs in this repo
git lfs install

#open *.als([1])
killall Terminal
exit
