
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-irc, 
   lisp_flexi-streams, lisp_split-sequence, lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_split-sequence lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-irc";
      
      sourceProject = "${lisp-project_cl-irc}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_split-sequence} ${lisp_usocket}";
      name = "lisp_cl-irc-0.9.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
