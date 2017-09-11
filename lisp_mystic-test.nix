
{ buildLispPackage, stdenv, fetchurl, lisp-project_mystic, 
   lisp_fiveam, lisp_mystic, lisp_mystic-library-template,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_mystic lisp_mystic-library-template  ];
      inherit stdenv;
      systemName = "mystic-test";
      
      sourceProject = "${lisp-project_mystic}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_mystic} ${lisp_mystic-library-template}";
      name = "lisp_mystic-test-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
