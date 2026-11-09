@echo off
setlocal
where mvn >nul 2>nul
if errorlevel 1 (
  echo Maven was not found. Install Maven 3.9+ and ensure mvn is on PATH.
  pause
  exit /b 1
)
mvn clean test
if errorlevel 1 exit /b 1
mvn exec:java -Dexec.mainClass="com.alisha.ums.app.Main"
endlocal
