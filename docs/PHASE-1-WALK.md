# Phase 1 — Get the Player Walking

This guide walks you through opening the project in Godot and getting a first-person controller working. By the end you'll be walking around a test floor with WASD + mouse look.

**Estimated time:** 1–2 hours if you've never used Godot before.

---

## Step 1 — Install Godot

1. Go to <https://godotengine.org/download>
2. Download **Godot Engine 4.x** (Standard, not .NET) for macOS
3. The download is a single app — no installer needed
4. Move it to your Applications folder
5. Launch it

You'll see the Project Manager. Close it for now.

## Step 2 — Open the Project

1. Launch Godot
2. Click **Import** (or **Import Existing Project**)
3. Navigate to your `whispers/` folder
4. Select the `project.godot` file inside it
5. Click **Import & Edit**

The Godot editor opens with the whispers project. You should see the file structure on the bottom-left (FileSystem panel): `scripts/Player.gd`, `scenes/`, `assets/`, etc.

## Step 3 — Set Up Input Mappings

We need to tell Godot which keys trigger which actions. The Player.gd script expects five actions: `move_forward`, `move_back`, `move_left`, `move_right`, `interact`.

1. Top menu: **Project → Project Settings**
2. Click the **Input Map** tab at the top of the window
3. For each action below:
   - Type the action name in the "Action" text field
   - Click **Add**
   - Click the **+** button that appears next to the action
   - Choose **Key**, press the key, click **OK**
4. Add these five:
   - `move_forward` → **W**
   - `move_back` → **S**
   - `move_left` → **A**
   - `move_right` → **D**
   - `interact` → **E**
5. Close the Project Settings window

## Step 4 — Build the Main Scene

We're going to create the scene the player walks around in.

1. In the FileSystem panel (bottom-left), right-click the **`scenes/`** folder
2. Choose **New Scene**
3. At the top of the scene panel, click **3D Scene** — this creates a `Node3D` as the root
4. Double-click the root node and rename it to `Main`
5. Press **Ctrl+S / Cmd+S** and save as `scenes/Main.tscn`

## Step 5 — Add a Floor

We need something for the player to stand on.

1. Right-click the **Main** node → **Add Child Node**
2. Search for `StaticBody3D`, double-click it
3. Rename it to `Floor`
4. Right-click **Floor** → Add Child Node → `MeshInstance3D`
5. Select the **MeshInstance3D**. In the Inspector (right panel), find **Mesh** → click `<null>` → choose **New BoxMesh**
6. Expand the Mesh property, set **Size** to `(40, 1, 40)` — a wide floor
7. Right-click **Floor** → Add Child Node → `CollisionShape3D`
8. Select the **CollisionShape3D**. In Inspector, find **Shape** → click `<null>` → choose **New BoxShape3D**
9. Expand the Shape, set **Size** to `(40, 1, 40)`
10. Select **Floor** itself. In Inspector, set **Transform → Position → Y** to `-1` (so the top of the floor is at y=0)

The MeshInstance3D is what you *see*. The CollisionShape3D is what the player *stands on*. Both are required.

## Step 6 — Add the Player

1. Right-click **Main** → Add Child Node → `CharacterBody3D`
2. Rename it to `Player`
3. From the FileSystem panel, drag **`scripts/Player.gd`** onto the **Player** node — the script attaches
4. Right-click **Player** → Add Child Node → `Camera3D`
5. Right-click **Player** → Add Child Node → `CollisionShape3D`
6. Select the **CollisionShape3D**. Set Shape → **New CapsuleShape3D**
7. In the capsule shape properties, set **Radius** to `0.4` and **Height** to `1.6`
8. Select **Camera3D**. Set **Transform → Position** to `(0, 0.6, 0)` — eye height
9. Select **Player** itself. Set **Transform → Position** to `(0, 1, 0)` — so it stands on the floor

## Step 7 — Add a Light

1. Right-click **Main** → Add Child Node → `DirectionalLight3D`
2. With it selected, set **Transform → Rotation → X** to `-45` (degrees)
3. Set **Transform → Rotation → Y** to `30`

This lights the scene like a low sun. Good enough for now — we'll do real horror lighting in Phase 8.

## Step 8 — Press Play

1. Press **F5** (or click the play button ▶ at the top-right)
2. Godot asks you to select a main scene — choose **`Main.tscn`**
3. The game runs. You're standing on a grey floor under a low sun.

**Controls:**
- **WASD** — walk
- **Mouse** — look around
- **Escape** — release the mouse (to close the window or click editor)
- **Click in window** — recapture the mouse

## If Something Doesn't Work

- **Black screen:**
  - Do you have a `DirectionalLight3D` in the scene?
  - Is the `Camera3D` a child of `Player` (not the floor)?
  - Is the camera position Y around 0.6 — not inside the floor?

- **Can't move:**
  - Check Input Map has all five actions (`move_forward`, `move_back`, `move_left`, `move_right`).
  - Check the Player node has `scripts/Player.gd` attached (you'll see a scroll icon on it).

- **Fall through floor:**
  - The Floor needs a `CollisionShape3D`, not just a `MeshInstance3D`.
  - The Player needs a `CollisionShape3D` too.

- **"No valid context" or script errors:**
  - Make sure you're using Godot 4.x, not 3.x. The script uses Godot 4 syntax.

## When It Works

Take a screenshot. You've built a working first-person controller in Godot. This is the foundation everything else builds on.

Then commit and move on to Phase 2 (Forest Shell).
