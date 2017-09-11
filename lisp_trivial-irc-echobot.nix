
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-irc, 
   lisp_trivial-irc,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-irc  ];
      inherit stdenv;
      systemName = "trivial-irc-echobot";
      
      sourceProject = "${lisp-project_trivial-irc}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-irc}";
      name = "lisp_trivial-irc-echobot-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
