
{ buildLispPackage, stdenv, fetchurl, lisp-project_hyperluminal-mem, 
   lisp_stmx, lisp_swap-bytes, lisp_osicat, lisp_cffi,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_stmx lisp_swap-bytes lisp_osicat lisp_cffi  ];
      inherit stdenv;
      systemName = "hyperluminal-mem";
      
      sourceProject = "${lisp-project_hyperluminal-mem}";
      patches = [];
      lisp_dependencies = "${lisp_stmx} ${lisp_swap-bytes} ${lisp_osicat} ${lisp_cffi}";
      name = "lisp_hyperluminal-mem-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
