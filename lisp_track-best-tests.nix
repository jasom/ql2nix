
{ buildLispPackage, stdenv, fetchurl, lisp-project_track-best, 
   lisp_nst, lisp_track-best,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_nst lisp_track-best  ];
      inherit stdenv;
      systemName = "track-best-tests";
      
      sourceProject = "${lisp-project_track-best}";
      patches = [];
      lisp_dependencies = "${lisp_nst} ${lisp_track-best}";
      name = "lisp_track-best-tests-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
