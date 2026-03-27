# Configs

Configs for games:
- Quake: for a few engines, some are neglected. Focused there on achieving Kex/DOS like feel and visuals (can be switched on-fly).
- Quake 2: mainly for q2pro's multiplayer, jump mod. For beginners and veterans. Currently most active here.

# Quake 2

## Engines

- [q2pro](https://github.com/MashedD/q2pro) - Skuller's repo doesn't longer exists, so here's up-to-date mirror + more changes.

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

Copy files that were created to where your `r1q2` will be, like so:
(all of them should have execute permissions)

```bash
baseq2/gamex86_64.so
quake2
r1q2ded
ref_gl.so
```

Now copy files from non-remastered Quake 2:

```
baseq2/players/
baseq2/pak0.pak
baseq2/pak1.pak
baseq2/pak2.pak
```

Create `baseq2/autoexec.cfg` with at least:

```
set vid_ref "gl" // To use ref_gl.so
set s_initsound "2" // OpenAL
set gl_mode "10" // FullHD on my machine
set _windowed_mouse "1" // Fix clipped mouse movement
set cl_run "1"
set freelook "1"
```

## Mods

- [3zb2-zigflag](https://github.com/MashedD/3zb2-zigflag) - newest version + small changes (TDM, store/recall, ...). Those are best working bots for any map

- [jump](https://github.com/Grish44/q2jump-global-integration) - apply patch `quake2/patches/jump.diff`. Additionally you'll need gfx for keys and server config. And some maps.

```bash
git clone https://github.com/Grish44/q2jump-global-integration
cd q2jump-global-integration
wget https://raw.githubusercontent.com/MashedD/configs/refs/heads/master/quake2/patches/jump.diff
git apply jump.diff
rm -f jump.diff

#
# Linux 64-bit
#

# You might need curl4 preset in your system to make gamex86_64.so properly work
make clean all

#
# Windows 32-bit
#

make -f makefile.win32 clean all
# Because couldn't build with curl being linked statically:
# Change dir to where your engine is and then:
cp -f /usr/i686-w64-mingw32/bin/lib{brotlicommon,brotlidec,crypto-3,curl-4,gcc_s_dw2-1,iconv-2,idn2-0,nghttp2-14,psl-5,ssh2,ssl-3,ssp-0,unistring-5,winpthread-1,zstd}.dll /usr/i686-w64-mingw32/bin/zlib1.dll .

#
# Windows 64-bit
#

make -f makefile.win64 clean all
# Because couldn't build with curl being linked statically:
# Change dir to where your engine is and then:
cp -f /usr/x86_64-w64-mingw32/bin/lib{brotlicommon,brotlidec,crypto-3-x64,curl-4,iconv-2,idn2-0,nghttp2-14,psl-5,ssh2,ssl-3-x64,ssp-0,unistring-5,winpthread-1,zstd}.dll /usr/x86_64-w64-mingw32/bin/zlib1.dll .
```

- [openffa](https://github.com/packetflinger/openffa)

```bash
git clone https://github.com/packetflinger/openffa
cd openffa
wget https://raw.githubusercontent.com/MashedD/configs/refs/heads/master/quake2/patches/openffa.diff
git apply openffa.diff
rm -f openffa.diff

# Linux 64-bit
make

# Windows 32-bit
make CONFIG_FILE=.config-win32 clean all

# Windows 64-bit
make CONFIG_FILE=.config-win64 clean all
```

- [opentdm](https://github.com/packetflinger/opentdm)

```bash
git clone https://github.com/packetflinger/opentdm
cd opentdm
wget https://raw.githubusercontent.com/MashedD/configs/refs/heads/master/quake2/patches/opentdm.diff
git apply opentdm.diff
rm -f opentdm.diff

# Linux 64-bit
make

# Windows 32-bit
make CONFIG_FILE=.config-win32 clean all

# Windows 64-bit
make CONFIG_FILE=.config-win64 clean all
```

- [openra2](https://github.com/packetflinger/openra2)
- [DDay: Normandy FPS](https://github.com/PowaBanga/DDaynormandyFPS) - apply patches `quake2/patches/DDaynormandyFPS-src-q2admin-tsmod.diff`, `quake2/patches/DDaynormandyFPS-src-dday.diff`, `quake2/patches/DDaynormandyFPS.diff`. [Maps](https://www.moddb.com/games/dday-normandy/addons/dday-normandy-map-pack-and-hi-res-textures). [Active Community](https://dday.cl/)
- [Chaos](https://github.com/aginies/quake2)

## Paks

TODO: Get paks from [quake2download.pl](https://quake2download.pl).

## Remastered

Visit [DarkMatter](https://darkmatter-quake.com/) and join Discord.
Check `creations` section.
You'll find There [Muff Mode](https://github.com/themuffinator/MuffMode), which is simliar to `opentdm`.
You can also use a [Map Trainer](https://github.com/ozy24/q2re-map-trainer), which is similar
to what `jump` mod allows - saving and restoring player's position.
Also additional paks and maps for Remaster and option to play ladder tournaments.

