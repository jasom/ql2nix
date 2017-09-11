
{ buildLispPackage, stdenv, fetchurl, lisp-project_archive, 
   lisp_cl-fad, lisp_trivial-gray-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "archive";
      
      sourceProject = "${lisp-project_archive}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_trivial-gray-streams}";
      name = "lisp_archive-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
