git diff-tree --no-commit-id --name-only -r head^ head > list.txt
python copyDeltaFiles.py
groovy PackageXMLGenerator.groovy delta/force-app/main/default delta/force-app/main/default/package.xml