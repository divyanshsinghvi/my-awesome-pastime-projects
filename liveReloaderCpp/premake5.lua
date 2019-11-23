workspace "RePlex"
  configurations {"Debug", "Release"}
  language "C++"
  targetdir "bin/%{cfg.buildcfg}"

  flags { cppdialect "C++14" }

  filter "configurations:Debug"
    defines {"DEBUG"}
    flags {symbols "On"}

  filter "configurations:Release"
    defines {"RELEASE"}
    optimize "On"

  project "RePlex"
    kind "SharedLib"
    files {"lib/**.h", "lib/**.cpp"}
    linkoptions {"-Wl,--no-as-needed","-ldl"}

  project "RePlexRuntime"
    kind "ConsoleApp"
    files {"runtime/**.h", "runtime/**.cpp"}
    links {"RePlex"}
    linkoptions {"-Wl,--no-as-needed","-ldl"}
    includedirs{"lib/pub"}

  project "RePlexTest"
    kind "SharedLib"
    files {"test/**.h", "test/**.cpp", "test/pub/*.h"}
