
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_dbi, lisp_lack, lisp_lack-session-store-dbi, lisp_lack-test, lisp_prove, lisp_prove-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_dbi lisp_lack lisp_lack-session-store-dbi lisp_lack-test lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "t-lack-session-store-dbi";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_dbi} ${lisp_lack} ${lisp_lack-session-store-dbi} ${lisp_lack-test} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_t-lack-session-store-dbi-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
