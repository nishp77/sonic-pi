set WORKING_DIR=%CD%

cd %~dp0

@echo Translating tutorial...
server\native\ruby\bin\ruby server/ruby/bin/i18n-tool.rb -t

@echo Generating docs for the Qt GUI...
copy /Y gui\qt\utils\ruby_help.tmpl gui\qt\utils\ruby_help.h
server\native\ruby\bin\ruby server/ruby/bin/qt-doc.rb -o gui\qt\utils/ruby_help.h

@echo Updating GUI translation files...
forfiles /p gui\qt\lang /s /m *.ts /c "cmd /c %QT_INSTALL_LOCATION%\bin\lrelease.exe @file"

cd %WORKING_DIR%
