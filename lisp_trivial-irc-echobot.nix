
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-irc, 
   lisp_usocket, lisp_split-sequence, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_split-sequence lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "trivial-irc-echobot";
      
      sourceProject = "${lisp-project_trivial-irc}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_split-sequence} ${lisp_cl-ppcre}";
      name = "lisp_trivial-irc-echobot-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
