
{ buildLispPackage, stdenv, fetchurl, lisp-project_glkit, 
   lisp_glkit, lisp_sdl2kit-examples,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_glkit lisp_sdl2kit-examples  ];
      inherit stdenv;
      systemName = "glkit-examples";
      
      sourceProject = "${lisp-project_glkit}";
      patches = [];
      lisp_dependencies = "${lisp_glkit} ${lisp_sdl2kit-examples}";
      name = "lisp_glkit-examples-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
