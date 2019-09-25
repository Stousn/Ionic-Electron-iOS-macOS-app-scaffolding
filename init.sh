echo "#################################################"
echo "IONIC ELECTRON iOS&Mac cross-platform scaffolding"
echo "#################################################"
echo "This might take some time. Grab a cup of coffee"
echo "              {{"
echo "             c[_]"
echo "#################################################"
echo "installing Ionic CLI, Cordova CLI and Angular CLI"
npm install -g ionic cordova
npm install -g @angular/cli

echo "create template ionic application"

ionic start iOSMac tabs --type angular

cd iOSMac &> /dev/null

echo "add iOS as target"
npm install -g cordova-res &> /dev/null
ionic cordova platform add ios &> /dev/null

echo "installing Electron"
npm install --save-dev electron &> /dev/null

echo "initializing main.js for Electron"
echo "const { app, BrowserWindow } = require('electron')
let win

function createWindow () {
  win = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      nodeIntegration: true
    }
  })

 win.loadURL('http://127.0.0.1:4200')

  win.on('closed', () => {
    win = null
  })
}
app.on('ready', createWindow)
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', () => {
  if (win === null) {
    createWindow()
  }
})" >> main.js

echo "add electron script to package.json"
npm install -g npm-add-script &> /dev/null

npmAddScript -k electron -v "electron main.js" &> /dev/null
npm-bin add electron main.js -o package.json &> /dev/null

echo "git commit changes"
git add .
git commit -m"iOS&Mac cross-platform scaffolding"

echo "#################################################"
echo "DONE"
echo " "
echo "             c[_]"
echo "#################################################"
echo "Now you can test your electron aplication with:"
echo "cd iOSMac; ng build --prod; npm start & sleep 30; npm run electron; kill \$!"
