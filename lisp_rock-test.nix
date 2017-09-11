
{ buildLispPackage, stdenv, fetchurl, lisp-project_rock, 
   lisp_fiveam, lisp_rock,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_rock  ];
      inherit stdenv;
      systemName = "rock-test";
      
      sourceProject = "${lisp-project_rock}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_rock}";
      name = "lisp_rock-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
