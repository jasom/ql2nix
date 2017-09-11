
{ buildLispPackage, stdenv, fetchurl, lisp-project_screamer, 
   lisp_hu-dwim-stefil, lisp_iterate, lisp_screamer,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-stefil lisp_iterate lisp_screamer  ];
      inherit stdenv;
      systemName = "screamer-tests";
      
      sourceProject = "${lisp-project_screamer}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-stefil} ${lisp_iterate} ${lisp_screamer}";
      name = "lisp_screamer-tests-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
