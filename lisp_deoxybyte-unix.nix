
{ buildLispPackage, stdenv, fetchurl, lisp-project_deoxybyte-unix, 
   lisp_cffi, lisp_deoxybyte-io, lisp_deoxybyte-systems,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_deoxybyte-io lisp_deoxybyte-systems  ];
      inherit stdenv;
      systemName = "deoxybyte-unix";
      
      sourceProject = "${lisp-project_deoxybyte-unix}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_deoxybyte-io} ${lisp_deoxybyte-systems}";
      name = "lisp_deoxybyte-unix-20140113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
