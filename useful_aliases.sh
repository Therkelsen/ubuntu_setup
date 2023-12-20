# Git aliases to speed up workflow
echo 'alias gfr="git fetch && git rebase origin/develop --autostash"' >> ~/.bashrc
echo 'alias gr="git rebase"' >> ~/.bashrc
echo 'alias gl="git log --oneline -n"' >> ~/.bashrc
echo 'alias gb="git branch"' >> ~/.bashrc
echo 'alias gcn="git checkout -b "' >> ~/.bashrc
echo 'alias gce="git checkout "' >> ~/.bashrc
echo 'alias grh="git reset --hard"' >> ~/.bashrc
echo 'alias gcp="git cherry-pick "' >> ~/.bashrc
echo 'alias gp="git push "' >> ~/.bashrc
echo 'alias gpf="git push -f "' >> ~/.bashrc

# Re-source bashrc
. ~/.bashrc
