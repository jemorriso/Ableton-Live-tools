#! /bin/zsh -f

gzip="zcat -f"
hook=.git/hooks/pre-commit

# unzip on add
git config filter.gzip.smudge $gzip
# unzip on pull
git config filter.gzip.clean $gzip
# when git needs to diff, unzip
git config diff.gzip.command $gzip
git config filter.gzip.required true

mkdir -p ./.git/hooks
cp pre-commit $hook && chmod +x $hook

git lfs install
