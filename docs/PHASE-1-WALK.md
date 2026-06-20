# Phase 1 — Get the Player Walking

The scene is already built. You just need to install Godot and press play.

**Estimated time:** 10–15 minutes (most of it is the Godot download).

---

## Step 1 — Install Godot

1. Go to <https://godotengine.org/download>
2. Download **Godot Engine 4.x** (Standard version, **not .NET**) for macOS
3. The download is a single app — no installer needed
4. Move it to your Applications folder
5. Launch it

You'll see the Project Manager. Don't create a new project — close it for now.

## Step 2 — Open This Project

1. In the Godot Project Manager, click **Import**
2. Click **Browse** and navigate to your `whispers/` folder
3. Select the **`project.godot`** file inside it
4. Click **Import & Edit**

The Godot editor opens with the whispers project. You should see `scenes/Main.tscn` in the FileSystem panel (bottom-left).

## Step 3 — Open the Main Scene

1. In the FileSystem panel, **double-click `scenes/Main.tscn`**
2. The scene opens in the editor — you'll see the Scene tree (left), the 3D viewport (center), and the Inspector (right)
3. You should see: a `Main` node containing `Floor`, `Player`, and `DirectionalLight3D`

## Step 4 — Press Play

1. Press **F5** (or click the play button ▶ at the top-right)
2. Because `project.godot` already declares `scenes/Main.tscn` as the main scene, the game starts immediately
3. The window opens. You're standing on a grey floor under a low sun.

**Controls:**
- **WASD** — walk
- **Mouse** — look around
- **Escape** — release the mouse (click the window again to recapture)
- **Close the window** to stop the game

## What's Already Set Up

You don't need to do these — they're already in the project:

- ✅ **Input mappings** — `move_forward` (W), `move_back` (S), `move_left` (A), `move_right` (D), `interact` (E). See them in **Project → Project Settings → Input Map**.
- ✅ **Player script** — first-person controller attached to the Player node
- ✅ **Player body** — `CharacterBody3D` with capsule collision, `Camera3D` at eye height
- ✅ **Floor** — 40×40 `StaticBody3D` with box mesh and collision
- ✅ **Light** — `DirectionalLight3D` tilted at 45° (dim, slightly warm — placeholder until Phase 8)
- ✅ **Dark background** — clear color is near-black for the eventual atmosphere

## If Something Doesn't Work

- **Black screen on play:**
  - Check the Scene tree has all four nodes: `Main`, `Floor`, `Player`, `DirectionalLight3D`.
  - If `Main.tscn` doesn't open, the file may have a syntax issue. Tell me what error Godot shows and I'll fix it.

- **Can't move (player just stands there):**
  - Check the Player node has the script attached — you'll see a scroll icon on it.
  - Check Input Map: **Project → Project Settings → Input Map**. You should see `move_forward`, `move_back`, `move_left`, `move_right`. If missing, the input section in `project.godot` didn't parse — tell me.

- **Player falls through floor:**
  - The Floor needs both `MeshInstance3D` AND `CollisionShape3D` — both are in the scene already. If you see only one, something's wrong with `Main.tscn`.

- **"Cannot run scene" or "No main scene set":**
  - Go to **Project → Project Settings → Application → Run → Main Scene** and select `scenes/Main.tscn` manually.

- **Script errors on play:**
  - Make sure you're on Godot 4.x, not 3.x. The script uses Godot 4 syntax (`@export`, `@onready`, `deg_to_rad`, etc.).
  - If you see specific errors, copy them and tell me.

## When It Works

You're standing on a grey floor in a dark world under a low sun. WASD moves you, mouse looks around, the world is silent. That's the foundation.

Next step: commit `Main.tscn` (no changes needed, but Godot may rewrite it on first open — that's fine) and start Phase 2 (Forest Shell).
