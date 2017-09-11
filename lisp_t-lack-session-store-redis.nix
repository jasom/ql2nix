
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_lack, lisp_lack-session-store-redis, lisp_lack-test, lisp_prove, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lack lisp_lack-session-store-redis lisp_lack-test lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "t-lack-session-store-redis";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_lack} ${lisp_lack-session-store-redis} ${lisp_lack-test} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_t-lack-session-store-redis-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
