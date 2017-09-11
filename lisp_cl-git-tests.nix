
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-git, 
   lisp_alexandria, lisp_cl-fad, lisp_cl-git, lisp_fiveam, lisp_flexi-streams, lisp_inferior-shell, lisp_local-time, lisp_unix-options,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-fad lisp_cl-git lisp_fiveam lisp_flexi-streams lisp_inferior-shell lisp_local-time lisp_unix-options  ];
      inherit stdenv;
      systemName = "cl-git/tests";
      
      sourceProject = "${lisp-project_cl-git}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-fad} ${lisp_cl-git} ${lisp_fiveam} ${lisp_flexi-streams} ${lisp_inferior-shell} ${lisp_local-time} ${lisp_unix-options}";
      name = "lisp_cl-git-tests-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
