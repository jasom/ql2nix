
{ buildLispPackage, stdenv, fetchurl, lisp-project_inferior-shell, 
   lisp_hu-dwim-stefil, lisp_inferior-shell,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-stefil lisp_inferior-shell  ];
      inherit stdenv;
      systemName = "inferior-shell/test";
      
      sourceProject = "${lisp-project_inferior-shell}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-stefil} ${lisp_inferior-shell}";
      name = "lisp_inferior-shell-test-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
