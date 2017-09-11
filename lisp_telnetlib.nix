
{ buildLispPackage, stdenv, fetchurl, lisp-project_telnetlib, 
   lisp_cl-ppcre, lisp_usocket, lisp_flexi-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_usocket lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "telnetlib";
      
      sourceProject = "${lisp-project_telnetlib}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_usocket} ${lisp_flexi-streams}";
      name = "lisp_telnetlib-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
