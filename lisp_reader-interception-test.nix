
{ buildLispPackage, stdenv, fetchurl, lisp-project_reader-interception, 
   lisp_fare-utils, lisp_hu-dwim-stefil, lisp_reader-interception,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fare-utils lisp_hu-dwim-stefil lisp_reader-interception  ];
      inherit stdenv;
      systemName = "reader-interception-test";
      
      sourceProject = "${lisp-project_reader-interception}";
      patches = [];
      lisp_dependencies = "${lisp_fare-utils} ${lisp_hu-dwim-stefil} ${lisp_reader-interception}";
      name = "lisp_reader-interception-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
