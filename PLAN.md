# Whispers — Vertical Slice Plan

## 1. Concept

A first-person 3D psychological horror adventure. An amnesiac wakes in a forest that shouldn't exist. The forest periodically shifts into dreamlike other places. A charismatic, wrong-faced entity offers to help them escape. The dead whisper warnings in forced cinematic cutscenes — but their warnings are unreliable, because **they don't know they're dead**. They think they escaped. They are warning the player based on incomplete memories of their own failure.

**Central question:** *What IS this place?*

**Answer:** It was built by the entity — a creature with a face, intelligent and cruel — to collect voices. It lets victims try to escape, because the trying is what feeds it. The only "escape" it offers is a lie: sacrifice someone else, bring them in, and you can go. But no one leaves. The moment a victim accepts the deal, they become the next whisper — without realizing it. They think they walked free. They are still here, whispering to the next one.

**Core emotional arc:** disorientation → curiosity → distrust → realization → dread. Not jump-scare horror — slow-burn, tragic, psychological.

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

## 6. Milestones

Each milestone ends with something playable. Don't skip ahead — motivation comes from seeing your own progress.

- [ ] **M0 — Setup.** Godot installed, project opens, `.gitignore` correct, first commit runs.
- [ ] **M1 — Walk.** Player capsule + camera, WASD + mouse look, walking on a flat plane. (1–3 days)
- [ ] **M2 — The forest shell.** Terrain (or just a plane with fog), 5–10 tree instances, skybox, ambient sound. Player can walk around. (3–5 days)
- [ ] **M3 — Interaction.** One object (a shoe). Raycast, "Press E" prompt, debug print. (1–2 days)
- [ ] **M4 — First whisper.** Interacting plays an audio clip + shows subtitle. (1 day)
- [ ] **M5 — First shift.** Trigger → fade → load hospital scene → 5 sec later → fade back. This is the hardest milestone. (3–5 days)
- [ ] **M6 — Story content.** All whisper lines written, all objects placed, shifts wired up. (1 week)
- [ ] **M7 — Atmosphere pass.** Lighting, fog density, post-processing (vignette, grain), audio mixing. (3–5 days)
- [ ] **M8 — Polish + ship.** Title screen, end screen, pause menu, export build, have someone else play it. (1 week)

**Realistic timeline for a beginner, part-time:** 8–12 weeks. That's faster than it sounds once M1 clears.

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

Stop learning when you can answer this: *"Could I make a cube move with WASD and print 'hello' when I look at it?"* If yes, you're ready for M2.

## 9. First Steps (this week)

1. Download Godot 4.3 from godotengine.org
2. Open the project, save the empty scene as `scenes/main.tscn`
3. Add `.gitignore` for Godot
4. Commit
5. Follow the GDScript "Step by step" tutorial
6. Ping me when you're stuck or when M1 is done

## 10. Open Questions (decide before M6)

**Answered:**
- ~~Player identity~~ → Blank / anonymous amnesiac, no defined past.
- ~~Whisper source~~ → Previous victims who think they escaped. Don't know they're dead.
- ~~Central mystery~~ → What IS this place? Answer: built by the Entity to collect voices.
- ~~Ending~~ → Sacrifice is a lie. Player becomes a whisper without realizing.

**Still open:**
- **The Entity's design.** What does its "wrong" face look like? (Mask? Sculpted? A real face stretched wrong?) — Sketch 3 concepts before M5.
- **Whisper voice acting.** AI-generated (ElevenLabs free tier) or your own voice pitched/filtered? Each whisperer needs a distinct timbre.
- **The Entity's voice.** Warm and reasonable (more unsettling) or flat and off (more uncanny)?
- **Language.** English? Turkish? Both? — Pick one for the slice; localize later.
- **The final choice framing.** Does the player know their choice doesn't matter, or is the trap hidden until the credits? (Recommendation: hide it. The realization IS the ending.)
