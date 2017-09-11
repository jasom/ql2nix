
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia-balland2006, 
   lisp_trivia-balland2006,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivia-balland2006  ];
      inherit stdenv;
      systemName = "trivia.balland2006.enabled";
      
      sourceProject = "${lisp-project_trivia-balland2006}";
      patches = [];
      lisp_dependencies = "${lisp_trivia-balland2006}";
      name = "lisp_trivia-balland2006-enabled-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
