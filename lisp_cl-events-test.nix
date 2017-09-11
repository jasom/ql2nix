
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-events, 
   lisp_cl-events, lisp_log4cl, lisp_mw-equiv, lisp_prove, lisp_prove-asdf,  
  clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-events lisp_log4cl lisp_mw-equiv lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-events.test";
      
      sourceProject = "${lisp-project_cl-events}";
      patches = [];
      lisp_dependencies = "${lisp_cl-events} ${lisp_log4cl} ${lisp_mw-equiv} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-events-test-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
