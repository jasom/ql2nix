
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-stefil, 
   lisp_hu-dwim-def, lisp_hu-dwim-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-def lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.stefil+hu.dwim.def";
      
      sourceProject = "${lisp-project_hu-dwim-stefil}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-def} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-stefil-hu-dwim-def-20170403-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
