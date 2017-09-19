
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-plumbing, 
   lisp_bordeaux-threads, lisp_trivial-gray-streams, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_trivial-gray-streams lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-plumbing";
      
      sourceProject = "${lisp-project_cl-plumbing}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_trivial-gray-streams} ${lisp_iterate}";
      name = "lisp_cl-plumbing-20120703-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
