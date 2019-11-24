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
  
  project "RePlexTest"
    kind "SharedLib"
    files {"test/**.cpp",  "test/pub/*.h"}

  project "RePlexRuntime"
    kind "ConsoleApp"
    files {"runtime/**.h", "runtime/**.cpp"}
    linkoptions {"-Wl,--no-as-needed","-ldl"}
    includedirs{"lib/pub", "test/pub"}

