
{ buildLispPackage, stdenv, fetchurl, lisp-project_petit-string-utils, 
   lisp_petit-string-utils, lisp_rt,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_petit-string-utils lisp_rt  ];
      inherit stdenv;
      systemName = "petit.string-utils-test";
      
      sourceProject = "${lisp-project_petit-string-utils}";
      patches = [];
      lisp_dependencies = "${lisp_petit-string-utils} ${lisp_rt}";
      name = "lisp_petit-string-utils-test-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
