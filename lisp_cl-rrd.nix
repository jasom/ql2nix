
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rrd, 
  rrdtool,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi rrdtool ];
      inherit stdenv;
      systemName = "cl-rrd";
      
      sourceProject = "${lisp-project_cl-rrd}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-rrd-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
