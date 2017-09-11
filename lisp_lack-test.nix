
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_flexi-streams, lisp_lack, lisp_prove, lisp_quri,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_lack lisp_prove lisp_quri  ];
      inherit stdenv;
      systemName = "lack-test";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_lack} ${lisp_prove} ${lisp_quri}";
      name = "lisp_lack-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
