
{ buildLispPackage, stdenv, fetchurl, lisp-project_deoxybyte-gzip, 
  zlib,   lisp_deoxybyte-io, lisp_deoxybyte-systems, lisp_deoxybyte-unix,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_deoxybyte-io lisp_deoxybyte-systems lisp_deoxybyte-unix zlib ];
      inherit stdenv;
      systemName = "deoxybyte-gzip";
      
      sourceProject = "${lisp-project_deoxybyte-gzip}";
      patches = [];
      lisp_dependencies = "${lisp_deoxybyte-io} ${lisp_deoxybyte-systems} ${lisp_deoxybyte-unix}";
      name = "lisp_deoxybyte-gzip-20140113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
