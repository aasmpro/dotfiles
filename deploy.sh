_RED='\033[0;31m'
_NC='\033[0m'

error(){
    echo -e "${_RED}$1${_NC}"
}

echo "Checking uncommited files"
{
    git diff-index --quiet HEAD --
} || {
    error "Aborted."
    error "You have uncommited files in this branch.";
    exit
}
echo "Deleting 'gh-pages' branch"
{
    git branch -D gh-pages
} || {}
echo "Creating new 'gh-pages' branch"
git checkout -b gh-pages
echo "Building"
mkdocs build -q -c -d _site
echo "Removing files"
find . -not -path './_site*' -not -path './.git*' -delete
echo "Moving site files"
mv _site/* .
echo "Cleaning up"
rm -r _site
echo "Commit and Push"
git add . -f
git commit -m "deploy: new version"
git push origin gh-pages
git stash
echo "New Version Deployed!"
git checkout master