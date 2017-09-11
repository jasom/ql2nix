
{ buildLispPackage, stdenv, fetchurl, lisp-project_lparallel, 
   lisp_lparallel,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lparallel  ];
      inherit stdenv;
      systemName = "lparallel-test";
      
      sourceProject = "${lisp-project_lparallel}";
      patches = [];
      lisp_dependencies = "${lisp_lparallel}";
      name = "lisp_lparallel-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
