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

read -p "new api name to generate. (e.g. SearchUser): " api_name

lower_api_name="$(echo ${api_name:0:1} | tr "[A-Z]" "[a-z]")${api_name:1}"
echo "lower_api_name: ${lower_api_name}"

swift run -c release --package-path ./Tools/GenesisTool genesis generate ./Genesis/API/template.yml\
     -d Genesis/API/output/$api_name\
     -o "upperAPIName: $api_name, lowerAPIName: $lower_api_name, date: $today, year: $current_year, developerName: $developer_name, developerCompany: $developer_company"

request_source="${PWD}/Genesis/API/output/${api_name}/Request/${api_name}Request.swift"
request_dest="${PWD}/Packages/AppCore/Sources/AppCore/Model/API/Request/${api_name}Request.swift"
cp -r -f ${request_source} ${request_dest}

response_source="${PWD}/Genesis/API/output/${api_name}/Response/${api_name}Response.swift"
response_dest="${PWD}/Packages/AppCore/Sources/AppCore/Model/API/Response/${api_name}Response.swift"
cp -r -f ${response_source} ${response_dest}

use_case_source="${PWD}/Genesis/API/output/${api_name}/UseCase/${api_name}UseCase.swift"
use_case_dest="${PWD}/Packages/UseCase/Sources/UseCase/${api_name}UseCase.swift"
cp -r -f ${use_case_source} ${use_case_dest}

repository_source="${PWD}/Genesis/API/output/${api_name}/Repository/${api_name}Repository.swift"
repository_dest="${PWD}/Packages/Infrastructure/Sources/Infrastructure/Repository/${api_name}Repository.swift"
cp -r -f ${repository_source} ${repository_dest}

data_source_source="${PWD}/Genesis/API/output/${api_name}/DataSource/${api_name}RemoteDataSource.swift"
data_source_dest="${PWD}/Packages/Infrastructure/Sources/Infrastructure/DataSource/API/${api_name}RemoteDataSource.swift"
cp -r -f ${data_source_source} ${data_source_dest}

rm -r ${PWD}/Genesis/API/output/${api_name}

echo -e "${api_name}APIを出力しました\n${request_dest}\n${response_dest}\n${use_case_dest}\n${repository_dest}\n${data_source_dest}"
