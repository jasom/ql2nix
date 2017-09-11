
{ buildLispPackage, stdenv, fetchurl, lisp-project_lredis, 
   lisp_babel, lisp_babel-streams, lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_babel-streams lisp_usocket  ];
      inherit stdenv;
      systemName = "lredis";
      
      sourceProject = "${lisp-project_lredis}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_babel-streams} ${lisp_usocket}";
      name = "lisp_lredis-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
