
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-git, 
  libgit2,   lisp_alexandria, lisp_anaphora, lisp_cffi, lisp_cffi-grovel, lisp_cl-fad, lisp_closer-mop, lisp_flexi-streams, lisp_local-time, lisp_trivial-garbage,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_cffi lisp_cffi-grovel lisp_cl-fad lisp_closer-mop lisp_flexi-streams lisp_local-time lisp_trivial-garbage libgit2 ];
      inherit stdenv;
      systemName = "cl-git";
      
      sourceProject = "${lisp-project_cl-git}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_cffi} ${lisp_cffi-grovel} ${lisp_cl-fad} ${lisp_closer-mop} ${lisp_flexi-streams} ${lisp_local-time} ${lisp_trivial-garbage}";
      name = "lisp_cl-git-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
