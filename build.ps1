python -m pip install -r requirements-dev.txt
if ($LastExitCode -ne 0) { exit $LastExitCode }
python -m pip install pyinstaller
python -m pip install -e .
if ($LastExitCode -ne 0) { exit $LastExitCode }
# 👇 uncomment this if you have cython extension
# python setup.py build_ext -i
# if ($LastExitCode -ne 0) { exit $LastExitCode }
pyinstaller --noconfirm -n any_app any_app/main.py
if ($LastExitCode -ne 0) { exit $LastExitCode }

$version = Select-String -Path setup.py -Pattern 'version="([\d.a-z\-]+)"' | % { "$($_.matches.groups[1] )" }
Compress-Archive dist/any_app "dist/any_app-${version}.zip" -Force
# do it twice, because it can say that "ZipArchiveHelper : any_app\base_library.zip is used by another process"
Compress-Archive dist/any_app "dist/any_app-${version}.zip" -Force

Write-Output "Building successful. Output files are in the 'dist' folder."
