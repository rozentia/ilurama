const path = require("path")
const fs = require("fs")

// exports.onPreInit = () => {
//   if (process.argv[2] === "build") {
//     fs.rmdirSync(path.join(__dirname, "dist"), { recursive: true })
//     fs.renameSync(
//       path.join(__dirname, "public"),
//       path.join(__dirname, "public_dev")
//     )
//   }
// }

// exports.onPostBuild = () => {
//     const targetPath = path.resolve(__dirname, '../../..', 'backend/hosting', 'public_main')
//     const sourcePath = path.resolve(__dirname, 'public')
//     if (fs.existsSync(targetPath)) {
//         fs.rmSync(targetPath, {recursive: true})
//     }
//     fs.renameSync(sourcePath, targetPath)
//     console.log('\n\n\n./public folder has been moved to ../../../backend/hosting/public_main\n')
// }
