
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-epmd, 
   lisp_epmd, lisp_fiveam, lisp_flexi-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_epmd lisp_fiveam lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "epmd-test";
      
      sourceProject = "${lisp-project_cl-epmd}";
      patches = [];
      lisp_dependencies = "${lisp_epmd} ${lisp_fiveam} ${lisp_flexi-streams}";
      name = "lisp_epmd-test-20140211-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
