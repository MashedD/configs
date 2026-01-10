# Configs

Configs for games:
- Quake: for a few engines, some are neglected. Focused there on achieving Kex/DOS like feel and visuals (can be switched on-fly).
- Quake 2: mainly for q2pro's multiplayer, jump mod. For beginners and veterans. Currently most active here.

# Quake 2

## Engines

- [q2pro](https://github.com/vloup/q2pro) - Skuller's repo doesn't longer exists, so here's a mirror. [Another Mirror](https://code.nephatrine.net/QuakeArchive/q2pro)

- [r1q2](https://github.com/tastyspleen/r1q2-archive)

Building:

```bash
sudo pacman -S libpng sdl12-compat # Arch/Artix/CachyOS/Manjaro/...
git clone https://github.com/tastyspleen/r1q2-archive.git
cd r1q2-archive
wget https://raw.githubusercontent.com/MashedD/configs/refs/heads/master/quake2/patches/r1q2.diff
git apply r1q2.diff
cd binaries
mkdir -p {r1q2ded,client,game,ref_gl}/.depends
make
```

Copy files there were created to locations like so, all of them should have
execute permissions:

```bash
r1q2/quake2
r1q2/r1q2ded
r1q2/ref_gl.so
r1q2/baseq2/gamex86_64.so
```

Now copy files from non-remastered Quake 2:

```
r1q2/baseq2/players/
r1q2/baseq2/pak0.pak
r1q2/baseq2/pak1.pak
r1q2/baseq2/pak2.pak
```

Create `r1q2/baseq2/autoexec.cfg` with at least:

```
set vid_ref "gl" // To use ref_gl.so
set s_initsound "2" // OpenAL
set gl_mode "10" // FullHD on my machine
set _windowed_mouse "1" // Fix clipped mouse movement
set cl_run "1"
set freelook "1"
```

## Mods

- [3zb2-zigflag](https://github.com/DirtBagXon/3zb2-zigflag) - apply patch `quake2/patches/3zb2-zigflag.diff`. Those are best working bots for any map.
- [jump](https://github.com/Grish44/q2jump-global-integration) - apply patch `quake2/patches/jump.diff`. Newest sources were not uploaded yet. In case global integration (downloading and replaying demos) is not downloading, reach out to Grish. Additionally you'll need gfx for keys and server config. And some maps.
- [openffa](https://github.com/skullernet/openffa)
- [opentdm](https://github.com/packetflinger/opentdm) - apply patch `quake2/patches/opentdm.diff`.
- [openra2](https://github.com/packetflinger/openra2)
- [DDay: Normandy FPS](https://github.com/PowaBanga/DDaynormandyFPS) - apply patches `quake2/patches/DDaynormandyFPS-src-q2admin-tsmod.diff`, `quake2/patches/DDaynormandyFPS-src-dday.diff`, `quake2/patches/DDaynormandyFPS.diff`. [Maps](https://www.moddb.com/games/dday-normandy/addons/dday-normandy-map-pack-and-hi-res-textures)
- [Chaos](https://github.com/aginies/quake2)

## Paks

Get paks from [quake2download.pl](https://quake2download.pl).

## Remastered

Visit [DarkMatter](https://darkmatter-quake.com/) and join Discord.
Check `creations` section.
You'll find There [Muff Mode](https://github.com/themuffinator/MuffMode), which is simliar to `opentdm`.
You can also use a [Map Trainer](https://github.com/ozy24/q2re-map-trainer), which is similar
to what `jump` mod allows - saving and restoring player's position.
Also additional paks and maps for Remaster and option to play ladder tournaments.

