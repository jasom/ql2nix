
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_lack-test, lisp_lack-util, lisp_prove, lisp_prove-asdf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lack-test lisp_lack-util lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "t-lack-util";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_lack-test} ${lisp_lack-util} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_t-lack-util-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
