# Whispers — Vertical Slice Plan

## 1. Concept

A first-person 3D psychological horror adventure. An amnesiac wakes in a forest that shouldn't exist. A nameless shapeshifting Entity — wearing the faces of the dead — offers to help them escape. The whispers of previous victims surface as fragments of memory: a lullaby, a face, a name, the weight of a sleeping child. They seem unrelated. They are not.

**Central question:** *What IS this place?*

**Answer:** The place was built by the Entity to collect voices. It lets victims try to escape, because the trying is what feeds it. The whispers are previous victims who accepted the Entity's deal — they sacrificed someone to "escape" and became whispers without realizing it. They think they walked free. They are still here, warning the next victim based on memories they don't understand.

**Deeper twist (revealed at the ending):** The memory fragments all describe the same person — a child. The child the player once had. The child the player brought here long ago in exchange for their own escape. The player forgot. The amnesia is the place's work. The player is not a new victim — they are the latest loop of the same one. The "waking in the forest" is not the start of their story; it is the loop restarting.

**Core emotional arc:** disorientation → curiosity → distrust → dread → realization (too late). Not jump-scare horror — slow-burn, tragic, psychological.

**Full story detail:** [STORY.md](./STORY.md) — Entity design, whisper aesthetic, object list, ending cinematic.

## 2. The Slice (20–30 min)

Beat-by-beat, what the player experiences:

1. **Cold open (2 min).** Wake in the forest at dusk. Fog. No memory, no name, no tutorial text. Ambient whispers — distant, not yet formed into words. Movement only.
2. **First whisper cutscene (2 min).** A clearing. A child's shoe on the ground. Interact → **FULL CINEMATIC** — world freezes, screen dims, whispers speak in broken fragments: *"Don't... trust the... it wears a..."* Cutscene cannot be skipped on first play. Player has no context yet.
3. **The Entity appears (3 min).** A larger clearing. The Entity is there. Human-shaped, but its face is *wrong* — uncanny, asymmetrical, the smile too wide. It speaks warmly. Calls itself a guide. Says it can show the player the way out. Offers to walk with them.
4. **Exploration + whispers (8 min).** Forest opens up. 3–4 interactable objects (a torn photograph, a name carved in bark, a music box, a jacket). Each triggers a forced cinematic whisper cutscene. Each adds a fragment:
   - *"It told me I could leave if I just..."*
   - *"I brought my brother here. He was supposed to take my place."*
   - *"Why can't I remember the road home?"*
   - *"I don't remember... dying."*
5. **Two dreamlike shifts (4 min total).** The forest dissolves — a hospital hallway that loops, an empty childhood bedroom. The Entity follows, commenting gently, reassuringly. The shifts don't make narrative sense. The disorientation *is* the point.
6. **The turn (3 min).** A whisper cutscene that breaks pattern. The whisperer starts to piece it together — trails off mid-thought: *"Wait. I did leave. I walked out. I... I'm still here. Why am I still—" * Silence. The forest goes quiet. The Entity is closer now.
7. **The choice (3 min).** The Entity makes its offer. Plainly, kindly: *bring someone here — anyone — and you go free.* The player can accept or refuse. **Both paths lead to the same ending.**
8. **Ending (2 min).** Whatever the player chose, the final cinematic plays: the player walking out of the forest, reaching a road, lights of a city, relief... then the whispers begin. The player's own voice among them. The screen shows another person — faceless, anonymous — waking in the forest. The cycle. Title card.

**Total environment work:** one small forest (~3 areas stitched) + two tiny interior rooms used only during shifts.

## 3. Core Mechanics

| Mechanic | Complexity | Notes |
|---|---|---|
| First-person walk + look | Low | Built-in Godot FPS controller; no physics complexity |
| Interact (look at object, press E) | Low | Raycast from camera + prompt UI |
| Whisper cutscene system | **High** | Forces player control off, dims world, plays audio + subtitles, cannot skip on first trigger. Reusable template — build once. |
| Reality shift (scene transition) | Medium | Fade + load alternate scene + return. Reuse for all shifts. |
| The Entity (NPC) | Medium | One character with a custom face (mask or sculpted asset), idle animation, lip-sync optional. Dialogue via audio + subtitles. |
| Subtitle/caption UI | Low | All whisper + Entity dialogue needs readable captions. |
| Choice UI (accept/refuse) | Low | One binary prompt near the end. Affects final cinematic framing only — both paths trap the player. |
| Save system | — | **Skip for slice.** One sitting, no save. |

## 4. Scope Guardrails

**In the slice (do these):**
- One forest area, ~3 sub-zones
- 2 brief interior shift locations
- 5–6 interactable objects
- ~12 whisper audio lines (can be AI-generated or recorded)
- Title screen + end screen
- Pause menu (audio/look sensitivity only)

**Out of the slice (do NOT build these yet):**
- Combat, weapons, health, stamina
- Inventory system
- Save/load
- Multiple endings
- Pursuing monster / AI enemy
- Localization
- Custom 3D models or animations
- Optimization beyond "runs at 60fps on your machine"

If you find yourself adding any "out" item, stop and write it in a `BACKLOG.md` instead. This is the #1 reason solo game projects die.

## 5. Tech Setup

- **Engine:** Godot 4.3+ (stable). Download from godotengine.org — get the **.NET** version only if you want C#; otherwise the standard build is fine. You're using GDScript.
- **Folder structure (create this on day one):**
  ```
  res://
    scenes/
      player/
      forest/
      shifts/
      ui/
    scripts/
    assets/
      models/
      audio/
        whispers/
        ambient/
      textures/
    data/
      whisper_lines.gd    # all narration text in one place
  ```
- **Version control:** you already have a git repo. Add a `.gitignore` for Godot: Godot keeps a `.godot/` cache folder you do NOT commit.

## 6. Phases

Each phase ends with something playable. Don't skip ahead — motivation comes from seeing your own progress.

- [x] **Phase 0 — Project Setup.** Godot installed, project structure, `.gitignore`, Player.gd script written. (1 day)
- [ ] **Phase 1 — Walk.** Player capsule + camera, WASD + mouse look, walking on a floor. See [`docs/PHASE-1-WALK.md`](./docs/PHASE-1-WALK.md). (3–5 days)
- [ ] **Phase 2 — Forest Shell.** Terrain (or plane with fog), 10–20 trees, skybox, ambient sound. Player can walk around. (3–5 days)
- [ ] **Phase 3 — Interaction.** Raycast, hover prompt, first interactable object. (3–5 days)
- [ ] **Phase 4 — Whisper Cutscene System.** Reusable forced-cinematic template. Audio + subtitle + dim/freeze. The hard part. (5–7 days)
- [ ] **Phase 5 — Reality Shifts.** Fade → load alternate scene → return. Two shifts (hospital hallway, childhood bedroom). (5–7 days)
- [ ] **Phase 6 — The Entity.** Character model, mask system, dialogue, follows player, choice UI. (7–10 days)
- [ ] **Phase 7 — Story Content.** All whisper fragments written + recorded, all objects placed, shifts wired, Entity dialogue written + recorded. (1–2 weeks)
- [ ] **Phase 8 — Polish & Ship.** Lighting pass, post-processing, audio mix, title/end/pause screens, export, external playtest. (1–2 weeks)

**Realistic timeline for a beginner, part-time:** 8–12 weeks. That's faster than it sounds once Phase 1 clears.

## 7. Asset Sources (all free, all CC0 or licensed for commercial use)

- **3D models:** Kenney.nl (start here — great packs, no attribution needed), Sketchfab (filter by CC0 / free), Quaternius
- **Audio:** Freesound.org (check the license — CC0 is safest), Pixabay Music (ambient drones)
- **Textures:** ambientCG.com (CC0), Poly Haven (CC0)
- **Skybox:** Poly Haven skies

Avoid anything that requires attribution if possible — bookkeeping kills solo projects.

## 8. Learning Path (don't skip)

As a beginner, spend the first week on these before touching the actual game:

1. **GDScript fundamentals.** The official "Step by step" tutorial in Godot docs (2 hours).
2. **Nodes + scenes.** Understand that everything is a node, scenes are reusable node trees. This is the single most important Godot concept.
3. **First-person controller.** Follow a 2024-era Godot 4 FPS tutorial on YouTube (GDQuest or StayAtHomeDev). Type it yourself — do not copy-paste.
4. **Signals.** Godot's event system. You'll need this for interaction triggers.

Stop learning when you can answer this: *"Could I make a cube move with WASD and print 'hello' when I look at it?"* If yes, you're ready for Phase 2.

## 9. First Steps (this week)

1. Download Godot 4.x from godotengine.org
2. Open the existing `whispers/` folder via **Import → select `project.godot`**
3. Follow [`docs/PHASE-1-WALK.md`](./docs/PHASE-1-WALK.md) — get the player walking
4. Commit your `Main.tscn` once it works
5. Ping me when you're stuck or when Phase 1 is done

## 10. Open Questions (decide before Phase 7)

**Answered:**
- ~~Player identity~~ → Blank / anonymous amnesiac.
- ~~Whisper source~~ → Previous victims who think they escaped. Don't know they're dead.
- ~~Central mystery~~ → What IS this place? Built by the Entity to collect voices.
- ~~Ending~~ → Sacrifice is a lie. Player becomes a whisper without realizing.
- ~~Entity face~~ → True face (creepy, rarely shown) + wears masks of dead victims + player's own face at climax.
- ~~Entity manner~~ → Cycling cold / mocking / rage. Never warm.
- ~~Entity name~~ → None. Refuses to give one.
- ~~Trust paranoia~~ → Entity claims to be a victim + forest has figures that may be it in disguise or may be real survivors.
- ~~Whisper cast~~ → Many voices, no individual identities. A chorus.
- ~~Whisper origins~~ → All sacrificed someone. Won't/can't say so.
- ~~Child's shoe~~ → Never explained. Just there.
- ~~Whisper aesthetic~~ → Unrelated memory fragments that resolve into a pattern at the ending.
- ~~The twist~~ → The memories are all of the player's own sacrificed child. Player is the loop, not the start.

**Still open:**
- **The Entity's true face design.** Needs 3 sketch concepts before Phase 6. Suggested: asymmetrical, too many teeth, eyes that don't track.
- **Specific whisper lines.** 12–15 fragments need to be written. Memory-texture, not warning-texture.
- **The Entity's dialogue.** 8–10 lines, mostly cold mode, one mocking, one rage flash.
- **Language.** English or Turkish? Pick one for the slice.
- **Whisper voice performance.** AI-generated (ElevenLabs) vs. own voice pitched/filtered.
- **The Entity's voice performance.** Flat/polite (recommended), whispered, or distorted?
- **Does the player realize before the credits?** Recommendation: no — the realization happens TO them in the final cinematic.
