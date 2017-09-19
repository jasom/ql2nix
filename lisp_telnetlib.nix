
{ buildLispPackage, stdenv, fetchurl, lisp-project_telnetlib, 
   lisp_flexi-streams, lisp_usocket, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_usocket lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "telnetlib";
      
      sourceProject = "${lisp-project_telnetlib}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_usocket} ${lisp_cl-ppcre}";
      name = "lisp_telnetlib-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
