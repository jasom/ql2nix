
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-irc, 
   lisp_cl-ppcre, lisp_split-sequence, lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_split-sequence lisp_usocket  ];
      inherit stdenv;
      systemName = "trivial-irc";
      
      sourceProject = "${lisp-project_trivial-irc}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_split-sequence} ${lisp_usocket}";
      name = "lisp_trivial-irc-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
