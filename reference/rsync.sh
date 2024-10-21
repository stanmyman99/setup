
# ---------------------------------------------------------------
# Rsync (for backup) reference
# ---------------------------------------------------------------
# synchronize the contents of Directory1 to Directory2, and leave no differences between the two. 
# If rsync finds that Directory2 has a file that Directory1 does not, it will delete it. 
# If rsync finds a file that has been changed, created, or deleted in Directory1, it will reflect those same changes to Directory2. 
rsync -avP --delete /Directory1/ /Directory2/
rsync -avP --delete -e ssh /Directory1/ geek@192.168.235.137:/Directory2/

