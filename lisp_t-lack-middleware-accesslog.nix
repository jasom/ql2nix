
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_lack, lisp_lack-test, lisp_prove, lisp_prove-asdf, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lack lisp_lack-test lisp_prove lisp_prove-asdf lisp_split-sequence  ];
      inherit stdenv;
      systemName = "t-lack-middleware-accesslog";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_lack} ${lisp_lack-test} ${lisp_prove} ${lisp_prove-asdf} ${lisp_split-sequence}";
      name = "lisp_t-lack-middleware-accesslog-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
