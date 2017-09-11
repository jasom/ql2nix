
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_cl-cookie, lisp_lack, lisp_lack-middleware-session, lisp_lack-test, lisp_prove, lisp_prove-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cookie lisp_lack lisp_lack-middleware-session lisp_lack-test lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "t-lack-middleware-session";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cookie} ${lisp_lack} ${lisp_lack-middleware-session} ${lisp_lack-test} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_t-lack-middleware-session-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
