
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-git, 
  libgit2,   lisp_closer-mop, lisp_anaphora, lisp_trivial-garbage, lisp_flexi-streams, lisp_local-time, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_anaphora lisp_trivial-garbage lisp_flexi-streams lisp_local-time lisp_cffi-grovel libgit2 ];
      inherit stdenv;
      systemName = "cl-git";
      
      sourceProject = "${lisp-project_cl-git}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_anaphora} ${lisp_trivial-garbage} ${lisp_flexi-streams} ${lisp_local-time} ${lisp_cffi-grovel}";
      name = "lisp_cl-git-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
