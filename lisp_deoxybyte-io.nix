
{ buildLispPackage, stdenv, fetchurl, lisp-project_deoxybyte-io, 
   lisp_getopt, lisp_deoxybyte-utilities, lisp_deoxybyte-systems,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_getopt lisp_deoxybyte-utilities lisp_deoxybyte-systems  ];
      inherit stdenv;
      systemName = "deoxybyte-io";
      
      sourceProject = "${lisp-project_deoxybyte-io}";
      patches = [];
      lisp_dependencies = "${lisp_getopt} ${lisp_deoxybyte-utilities} ${lisp_deoxybyte-systems}";
      name = "lisp_deoxybyte-io-20140113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
