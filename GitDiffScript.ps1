param([String]$firstcommit="HEAD", [String]$secondcommit="$firstcommit^")

$singlecommit = $secondcommit -eq "${firstcommit}^"


# get commit hash from name. Used for naming the zip.
$firstcommit = $(git rev-parse --short --verify $firstcommit)
$secondcommit = $(git rev-parse --short --verify $secondcommit)


$outpath = "${firstcommit}"
if (!$singlecommit) {
	$outpath += "_${secondcommit}"
}


echo "Diff ${firstcommit}...${secondcommit}"

echo "Changed files:"
echo $(git diff --name-only $firstcommit $secondcommit)
echo $(git diff --name-only $firstcommit $secondcommit) >> "ChangedFilesList.txt"

# create flattened archive
#Compress-Archive -Force -DestinationPath "${outpath}_flat.zip" -Path $(git diff --name-only $firstcommit $secondcommit)

# create structured archive
#git archive -o "${outpath}.zip" $firstcommit $(git diff --name-only $firstcommit $secondcommit)

echo "Created $outpath"