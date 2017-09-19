
{ buildLispPackage, stdenv, fetchurl, lisp-project_irc-logger, 
   lisp_cl-ppcre, lisp_cl-irc,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_cl-irc  ];
      inherit stdenv;
      systemName = "irc-logger";
      
      sourceProject = "${lisp-project_irc-logger}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_cl-irc}";
      name = "lisp_irc-logger-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
