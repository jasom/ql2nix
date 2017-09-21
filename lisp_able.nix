
{ buildLispPackage, stdenv, fetchurl, lisp-project_able, 
   lisp_cl-fad, lisp_trivial-gray-streams, lisp_ltk,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_trivial-gray-streams lisp_ltk  ];
      inherit stdenv;
      systemName = "able";
      
      sourceProject = "${lisp-project_able}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_trivial-gray-streams} ${lisp_ltk}";
      name = "lisp_able-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }