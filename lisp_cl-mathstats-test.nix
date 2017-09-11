
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mathstats, 
   lisp_cl-mathstats, lisp_lift,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-mathstats lisp_lift  ];
      inherit stdenv;
      systemName = "cl-mathstats-test";
      
      sourceProject = "${lisp-project_cl-mathstats}";
      patches = [];
      lisp_dependencies = "${lisp_cl-mathstats} ${lisp_lift}";
      name = "lisp_cl-mathstats-test-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
