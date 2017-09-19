
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-vhdl, 
   lisp_esrap-liquid, lisp_cl-interpol, lisp_cl-ppcre, lisp_cl-itertools, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_esrap-liquid lisp_cl-interpol lisp_cl-ppcre lisp_cl-itertools lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-vhdl";
      
      sourceProject = "${lisp-project_cl-vhdl}";
      patches = [];
      lisp_dependencies = "${lisp_esrap-liquid} ${lisp_cl-interpol} ${lisp_cl-ppcre} ${lisp_cl-itertools} ${lisp_iterate}";
      name = "lisp_cl-vhdl-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
