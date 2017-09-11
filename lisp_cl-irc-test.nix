
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-irc, 
   lisp_cl-irc, lisp_rt, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-irc lisp_rt lisp_split-sequence  ];
      inherit stdenv;
      systemName = "cl-irc-test";
      
      sourceProject = "${lisp-project_cl-irc}";
      patches = [];
      lisp_dependencies = "${lisp_cl-irc} ${lisp_rt} ${lisp_split-sequence}";
      name = "lisp_cl-irc-test-0.9.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
