
{ buildLispPackage, stdenv, fetchurl, lisp-project_scribble, 
   lisp_babel, lisp_hu-dwim-stefil, lisp_scribble,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_hu-dwim-stefil lisp_scribble  ];
      inherit stdenv;
      systemName = "scribble/test";
      
      sourceProject = "${lisp-project_scribble}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_hu-dwim-stefil} ${lisp_scribble}";
      name = "lisp_scribble-test-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
