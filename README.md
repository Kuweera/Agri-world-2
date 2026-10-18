# AgriWorld 3D — Starter Project

This is the first playable prototype foundation for the offline farming simulator.

## Included
- Godot 4 project using the Compatibility renderer for low-end Android devices.
- Simple 3D farm, four starter plots, barn, silo, and a driveable primitive tractor.
- Touch driving buttons and keyboard controls for desktop testing.
- Prototype maize loop: plant, wait about 45 seconds, harvest 10 bags, sell to NPC buyer.
- GitHub Actions workflow intended to export a debug Android APK.

## Important
This is an early prototype, not a finished game. The graphics use simple shapes so the first build can focus on verifying the Android pipeline and gameplay loop. The project has not been built on the target TECNO device in this package.

## Build through GitHub
1. Create a repository named `AgriWorld-3D`.
2. Upload the contents of this folder to the repository root (make sure `.github/workflows/build-android.yml` is included).
3. Open the repository's **Actions** tab.
4. Select **Build AgriWorld 3D Android APK** and press **Run workflow**. You can also trigger it by pushing to `main`.
5. Open the completed run and download the `AgriWorld3D-debug-apk` artifact.

If the build fails, open the workflow log and share the error. Android export templates/SDK availability may require adjusting the CI image or export setup; don't assume a successful APK until Actions confirms it.

## Controls
- On Android: use the on-screen arrows to drive the tractor.
- On desktop: WASD or arrow keys.
- Tap PLANT MAIZE, wait, tap HARVEST, then SELL CROP.

## Future-ready structure
Keep simulation logic in scripts/resources separate from presentation. Add crops, machinery and systems incrementally. Use versioned saves and backups before expanding save data. Keep future online services optional and separate from offline progression.
