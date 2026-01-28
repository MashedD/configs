# Configs

Configs for games:
- Quake: for a few engines, some are neglected. Focused there on achieving Kex/DOS like feel and visuals (can be switched on-fly).
- Quake 2: mainly for q2pro's multiplayer, jump mod. For beginners and veterans. Currently most active here.

# Quake 2

## Engines

- [q2pro](https://github.com/vloup/q2pro) - Skuller's repo doesn't longer exists, so here's up-to-date mirror.

Building:

```bash
#
# q2pro: building on Linux
# Tested on CachyOS
#

# Common steps
sudo pacman -S meson ninja pkgconaf
git clone https://github.com/vloup/q2pro
cd q2pro

cat > static-zlib.patch << 'EOF'
diff --git a/meson.build b/meson.build
index 72394eac..c6ef83fd 100644
--- a/meson.build
+++ b/meson.build
@@ -257,6 +257,7 @@ texture_formats = []
 fallback_opt = ['default_library=static']

 zlib = dependency('zlib',
+  static:          true,
   fallback:        'zlib-ng',
   required:        get_option('zlib'),
   default_options: fallback_opt + [ 'tests=disabled', 'zlib-compat=true', 'force-sse2=true' ],
EOF
patch -p1 < static-zlib.patch
rm -f static-zlib.patch

# Windows 64-bit
sudo pacman -S \
    mingw-w64-tools \
    mingw-w64-binutils \
    mingw-w64-crt \
    mingw-w64-gcc \
    mingw-w64-headers \
    mingw-w64-winpthreads
paru -S \
    mingw-w64-zlib \
    mingw-w64-ffmpeg \
    mingw-w64-pkg-config
cat > cross-mingw64.txt << 'EOF'
[binaries]
c = '/usr/bin/x86_64-w64-mingw32-gcc'
cpp = '/usr/bin/x86_64-w64-mingw32-g++'
ar = '/usr/bin/x86_64-w64-mingw32-ar'
strip = '/usr/bin/x86_64-w64-mingw32-strip'
windres = '/usr/bin/x86_64-w64-mingw32-windres'
pkgconfig = '/usr/bin/x86_64-w64-mingw32-pkg-config'

[host_machine]
system = 'windows'
cpu_family = 'x86_64'
cpu = 'x86_64'
endian = 'little'

[properties]
needs_exe_wrapper = true
EOF
rm -rf build-win64
meson setup build-win64 \
    --cross-file cross-mingw64.txt \
    --buildtype=release \
    -Db_lto=true \
    -Db_staticpic=true \
    -Db_pie=false
meson compile -C build-win64

#
# Windows 32-bit
#
paru -S llvm-mingw-w64-toolchain-ucrt-bin
cat > cross-mingw32.txt << 'EOF'
[binaries]
c       = '/usr/bin/i686-w64-mingw32-gcc'
cpp     = '/usr/bin/i686-w64-mingw32-g++'
ar      = '/usr/bin/i686-w64-mingw32-ar'
strip   = '/usr/bin/i686-w64-mingw32-strip'
windres = '/usr/bin/i686-w64-mingw32-windres'
pkgconfig = '/usr/bin/i686-w64-mingw32-pkg-config'

[host_machine]
system = 'windows'
cpu_family = 'x86'
cpu = 'i686'
endian = 'little'

[properties]
needs_exe_wrapper = true
pkg_config_libdir = ['/usr/i686-w64-mingw32/lib/pkgconfig']
EOF
rm -rf build-win32
meson setup build-win32 \
  --cross-file cross-mingw32.txt \
  --buildtype=release \
  -Db_lto=true \
  -Db_staticpic=true \
  -Db_pie=false
meson compile -C build-win32

#
# Linux 64-bit
#

meson setup build-lin64 --buildtype=release
meson compile -C build-lin64
```

To play, copy files from non-remastered Quake 2:

```
baseq2/players/
baseq2/pak0.pak
baseq2/pak1.pak
baseq2/pak2.pak
```

Additionally Copy file `src/client/ui/q2pro.menu` to `baseq2` folder.

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

- [3zb2-zigflag](https://github.com/DirtBagXon/3zb2-zigflag) - apply patch `quake2/patches/3zb2-zigflag.diff`. Those are best working bots for any map.
- [jump](https://github.com/Grish44/q2jump-global-integration) - apply patch `quake2/patches/jump.diff`. Additionally you'll need gfx for keys and server config. And some maps.

```bash
git clone https://github.com/Grish44/q2jump-global-integration
cd q2jump-global-integration
wget https://raw.githubusercontent.com/MashedD/configs/refs/heads/master/quake2/patches/jump.diff
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
- [opentdm](https://github.com/packetflinger/opentdm) - apply patch `quake2/patches/opentdm.diff`.
- [openra2](https://github.com/packetflinger/openra2)
- [DDay: Normandy FPS](https://github.com/PowaBanga/DDaynormandyFPS) - apply patches `quake2/patches/DDaynormandyFPS-src-q2admin-tsmod.diff`, `quake2/patches/DDaynormandyFPS-src-dday.diff`, `quake2/patches/DDaynormandyFPS.diff`. [Maps](https://www.moddb.com/games/dday-normandy/addons/dday-normandy-map-pack-and-hi-res-textures)
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

