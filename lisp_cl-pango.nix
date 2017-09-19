
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-pango, 
  pango,   lisp_xmls, lisp_cl-cairo2, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_xmls lisp_cl-cairo2 lisp_cffi pango ];
      inherit stdenv;
      systemName = "cl-pango";
      
      sourceProject = "${lisp-project_cl-pango}";
      patches = [];
      lisp_dependencies = "${lisp_xmls} ${lisp_cl-cairo2} ${lisp_cffi}";
      name = "lisp_cl-pango-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
