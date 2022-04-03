#!/usr/bin/env sh

parse_git_user() {
    git config --get user.name
}

today=`date "+%Y/%m/%d"`
current_year=`date "+%Y"`

developer_name=$(parse_git_user)
developer_company="Yuki Okudera"

echo $today
echo $current_year
echo $developer_name
echo $developer_company

read -p "new scene name to generate. (e.g. SearchRepo): " sceneName

# モジュールの存在確認
destination="${PWD}/Packages/Presentation/Sources/Presentation/Scene/${sceneName}"

echo $destination

if [ -d "$destination" ]; then
    swift run -c release --package-path ./Tools/GenesisTool genesis generate ./Genesis/Scene/template.yml\
    -d Genesis/Scene/output/$sceneName\
    -o "sceneName: $sceneName, date: $today, year: $current_year, developerName: $developer_name, developerCompany: $developer_company"

    echo "シーンが既に存在するので、Genesis/Scene/output/${sceneName}に出力しました"
else
    swift run -c release --package-path ./Tools/GenesisTool genesis generate ./Genesis/Scene/template.yml\
    -d "$destination"\
    -o "sceneName: $sceneName, date: $today, year: $current_year, developerName: $developer_name, developerCompany: $developer_company"

    echo "${sceneName}シーンのソースコードを出力しました\n${destination}"
fi
